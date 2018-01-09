// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:intl/intl.dart';
import 'package:angular_components/button_decorator/button_decorator.dart';
import 'package:angular_components/dynamic_component/dynamic_component.dart';
import 'package:angular_components/glyph/glyph.dart';
import 'package:angular_components/material_checkbox/material_checkbox.dart';
import 'package:angular_components/material_select/activation_handler.dart';
import 'package:angular_components/mixins/material_dropdown_base.dart';
import 'package:angular_components/model/a11y/active_item_mixin.dart';
import 'package:angular_components/model/selection/selection_container.dart';
import 'package:angular_components/model/selection/selection_model.dart';
import 'package:angular_components/model/ui/has_factory.dart';
import 'package:angular_components/utils/angular/properties/properties.dart';
import 'package:angular_components/utils/browser/dom_service/dom_service.dart';
import 'package:angular_components/utils/disposer/disposer.dart';

/// Material Select Item is a special kind of list item which can be selected.
@Component(
  selector: 'material-select-item',
  host: const {
    'class': 'item',
    '[class.disabled]': 'disabled',
    '[class.hidden]': 'isHidden',
    '[class.selected]': 'isSelected',
    '[class.multiselect]': 'supportsMultiSelect',
    'tabindex': '0',
    'role': 'option'
  },
  providers: const [
    const Provider(SelectionItem, useExisting: MaterialSelectItemComponent),
    const Provider(HasRenderer, useExisting: MaterialSelectItemComponent)
  ],
  styleUrls: const ['material_select_item.scss.css'],
  directives: const [
    GlyphComponent,
    MaterialCheckboxComponent,
    NgIf,
    DynamicComponent
  ],
  templateUrl: 'material_select_item.html',
)
class MaterialSelectItemComponent extends ButtonDirective
    with ActiveItemMixin
    implements
        OnDestroy,
        SelectionItem,
        HasRenderer,
        HasComponentRenderer,
        HasFactoryRenderer {
  final _disposer = new Disposer.oneShot();
  final ActivationHandler _activationHandler;
  final ChangeDetectorRef _cdRef;
  final DropdownHandle _dropdown;

  @override
  final HtmlElement element;

  @override
  final DomService domService;

  StreamSubscription _selectionChangeStreamSub;

  MaterialSelectItemComponent(
      this.element,
      this.domService,
      @Optional() this._dropdown,
      @Optional() this._activationHandler,
      this._cdRef)
      : super(element) {
    _disposer
      ..addStreamSubscription(trigger.listen(handleActivate))
      ..addFunction(() => _selectionChangeStreamSub?.cancel());
  }

  /// Whether the item should be hidden.
  ///
  /// False by default.
  bool get isHidden => _isHidden;
  @Input()
  set isHidden(value) {
    _isHidden = getBool(value);
  }

  bool _isHidden = false;

  /// The value this selection item represents.
  ///
  /// If the object implements [HasUIDisplayName], it will render use
  /// the `uiDisplayName` field as the label for the item. Otherwise, the label
  /// is only generated by this component if an [ItemRenderer] is provided
  /// (via the `itemRenderer` property).
  @override
  dynamic get value => _value;
  @Input()
  @override
  set value(val) {
    _value = val;
  }

  dynamic _value;

  bool _supportsMultiSelect = false;

  /// Whether the container supports selecting multiple items.
  bool get supportsMultiSelect => _supportsMultiSelect;

  /// Whether to hide the checkbox.
  ///
  /// False by default.
  bool get hideCheckbox => _hideCheckbox;
  @Input()
  set hideCheckbox(value) {
    _hideCheckbox = getBool(value);
  }

  bool _hideCheckbox = false;

  /// A function to render an item as a String.
  ///
  /// If none is provided, no label is generated (labels can still be passed
  /// as content).
  @override
  ItemRenderer get itemRenderer => _itemRenderer;
  @Input()
  @override
  set itemRenderer(ItemRenderer value) {
    _itemRenderer = value;
  }

  ItemRenderer _itemRenderer = nullRenderer;

  /// Returns a type for dynamic component loader to use to render item.
  ///
  /// Use instead of manual label or item renderer.
  @Input()
  @override
  @Deprecated('Use factoryrenderer instead as it will produce more '
      'tree-shakeable code.')
  ComponentRenderer componentRenderer;

  @Input()
  @override
  FactoryRenderer factoryRenderer;

  /// If true, check marks are used instead of checkboxes to indicate whether or
  /// not the item is selected for multi-select items.
  ///
  /// This particular style is used in material menu dropdown for multi-select
  /// menu item groups.
  bool get useCheckMarks => _useCheckMarks;

  @Input()
  set useCheckMarks(value) {
    _useCheckMarks = getBool(value);
  }

  bool _useCheckMarks = false;

  /// If true, triggering this item component will select the [value] within the
  /// [selection]; if false, triggering this item component will do nothing.
  bool get selectOnActivate => _selectOnActivate;

  @Input()
  set selectOnActivate(bool value) {
    _selectOnActivate = getBool(value);
  }

  bool _selectOnActivate = true;

  bool get valueHasLabel => valueLabel != null;
  String get valueLabel {
    if (_value == null) {
      return null;
    } else if (componentRenderer == null &&
        factoryRenderer == null &&
        !identical(itemRenderer, nullRenderer)) {
      return itemRenderer(_value);
    }
    return null;
  }

  /// Selection model to update with changes.
  @override
  SelectionModel get selection => _selection;
  @Input()
  @override
  set selection(SelectionModel sel) {
    _selection = sel;
    _supportsMultiSelect = sel is MultiSelectionModel;

    // Eventually change this component to onpush. This should be step in that
    // direction to support onpush components that use this component. There may
    // be other mutable state that needs to trigger change detection.
    _selectionChangeStreamSub?.cancel();
    _selectionChangeStreamSub = sel.selectionChanges.listen((_) {
      _cdRef.markForCheck();
    });
  }

  SelectionModel _selection;

  /// Manually mark items selected.
  bool get selected => _selected;
  @Input()
  set selected(value) {
    _selected = getBool(value);
  }

  bool _selected = false;

  /// Whether to cause dropdown to be closed on activation.
  ///
  /// True by default.
  bool get closeOnActivate => _closeOnActivate;
  @Input()
  set closeOnActivate(value) {
    _closeOnActivate = getBool(value);
  }

  bool _closeOnActivate = true;

  // TODO(google): Remove after migration from ComponentRenderer is complete
  Type get componentType =>
      componentRenderer != null ? componentRenderer(value) : null;

  ComponentFactory get componentFactory =>
      factoryRenderer != null ? factoryRenderer(value) : null;

  /// Whether this item should be marked as selected.
  bool get isSelected => _isMarkedSelected || _isSelectedInSelectionModel;

  bool get _isMarkedSelected => selected != null && selected;
  bool get _isSelectedInSelectionModel =>
      value != null && (_selection?.isSelected(value) ?? false);

  void handleActivate(UIEvent e) {
    var hasCheckbox = supportsMultiSelect && !hideCheckbox;
    if (closeOnActivate && !hasCheckbox) {
      _dropdown?.close();
    }

    if (_activationHandler?.handle(e, value) ?? false) return;
    if (selectOnActivate && _selection != null && value != null) {
      if (_selection.isSelected(value)) {
        _selection.deselect(value);
      } else {
        _selection.select(value);
      }
    }
  }

  @override
  void ngOnDestroy() {
    _disposer.dispose();
  }

  String get selectedMessage => Intl.message('Click to deselect',
      name: 'selectedMessage',
      desc: 'Label for an icon describing possible interactions with a '
          'selected menu item.');

  String get notSelectedMessage => Intl.message('Click to select',
      name: 'notSelectedMessage',
      desc: 'Label for an icon describing possible interactions with a '
          'non-selected menu item.');
}
