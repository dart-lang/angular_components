// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library angular_components;

import 'package:angular/angular.dart' show Provider;

import 'app_layout/material_persistent_drawer.dart';
import 'app_layout/material_temporary_drawer.dart';
import 'auto_dismiss/auto_dismiss.dart';
import 'button_decorator/button_decorator.dart';
import 'content/deferred_content.dart';
import 'dynamic_component/dynamic_component.dart';
import 'focus/focus.dart';
import 'focus/focus_activable_item.dart';
import 'focus/focus_item.dart';
import 'focus/focus_list.dart';
import 'focus/focus_trap.dart';
import 'focus/keyboard_only_focus_indicator.dart';
import 'glyph/glyph.dart';
import 'highlighted_text/highlighted_text.dart';
import 'highlighted_text/highlighted_value.dart';
import 'material_button/material_button.dart';
import 'material_button/material_button_base.dart';
import 'material_button/material_fab.dart';
import 'material_checkbox/material_checkbox.dart'
    show MaterialCheckboxComponent;
import 'material_chips/material_chip.dart';
import 'material_chips/material_chips.dart';
import 'material_dialog/material_dialog.dart';
import 'material_expansionpanel/material_expansionpanel.dart';
import 'material_expansionpanel/material_expansionpanel_auto_dismiss.dart';
import 'material_expansionpanel/material_expansionpanel_set.dart';
import 'material_icon/material_icon.dart';
import 'material_input/material_auto_suggest_input.dart';
import 'material_input/material_input.dart'
    hide materialInputErrorKey;
import 'material_input/material_input_default_value_accessor.dart';
import 'material_input/material_input_multiline.dart';
import 'material_input/material_number_accessor.dart';
import 'material_input/material_number_validators.dart';
import 'material_input/material_percent_directive.dart';
import 'material_list/material_list.dart';
import 'material_list/material_list_item.dart';
import 'material_popup/material_popup.dart';
import 'material_progress/material_progress.dart';
import 'material_radio/material_radio.dart';
import 'material_radio/material_radio_group.dart';
import 'material_ripple/material_ripple.dart';
import 'material_select/display_name.dart';
import 'material_select/dropdown_button.dart';
import 'material_select/material_dropdown_select.dart';
import 'material_select/material_select.dart';
import 'material_select/material_select_dropdown_item.dart';
import 'material_select/material_select_item.dart';
import 'material_select/material_select_searchbox.dart';
import 'material_spinner/material_spinner.dart';
import 'material_tab/fixed_material_tab_strip.dart';
import 'material_tab/material_tab.dart';
import 'material_tab/material_tab_panel.dart';
import 'material_tab/tab_button.dart';
import 'material_toggle/material_toggle.dart';
import 'material_tooltip/material_tooltip.dart';
import 'material_tree/material_tree.dart';
import 'material_yes_no_buttons/material_yes_no_buttons.dart';
import 'reorder_list/reorder_list.dart';
import 'scorecard/scoreboard.dart';
import 'scorecard/scorecard.dart';
import 'stop_propagation/stop_propagation.dart';
import 'theme/dark_theme.dart';
import 'laminate/components/modal/modal.dart';
import 'laminate/popup/module.dart';
import 'laminate/popup/popup.dart';

export 'annotations/rtl_annotation.dart';
export 'app_layout/material_drawer_base.dart';
export 'app_layout/material_persistent_drawer.dart';
export 'app_layout/material_temporary_drawer.dart';
export 'auto_dismiss/auto_dismiss.dart';
export 'button_decorator/button_decorator.dart';
export 'content/deferred_content.dart';
export 'content/deferred_content_aware.dart';
export 'dynamic_component/dynamic_component.dart';
export 'focus/focus.dart';
export 'focus/focus_activable_item.dart';
export 'focus/focus_item.dart';
export 'focus/focus_list.dart';
export 'focus/focus_trap.dart';
export 'focus/keyboard_only_focus_indicator.dart';
export 'forms/error_renderer.dart';
export 'glyph/glyph.dart';
export 'highlighted_text/highlighted_text.dart';
export 'highlighted_text/highlighted_value.dart';
export 'material_button/material_button.dart';
export 'material_button/material_button_base.dart';
export 'material_button/material_fab.dart';
export 'material_checkbox/material_checkbox.dart'
    show MaterialCheckboxComponent;
export 'material_chips/material_chip.dart';
export 'material_chips/material_chips.dart';
export 'material_dialog/material_dialog.dart';
export 'material_expansionpanel/material_expansionpanel.dart';
export 'material_expansionpanel/material_expansionpanel_auto_dismiss.dart';
export 'material_expansionpanel/material_expansionpanel_set.dart';
export 'material_icon/material_icon.dart';
export 'material_input/base_material_input.dart';
export 'material_input/deferred_validator.dart';
export 'material_input/input_wrapper.dart';
export 'material_input/material_auto_suggest_input.dart';
export 'material_input/material_input.dart'
    hide materialInputErrorKey;
export 'material_input/material_input_default_value_accessor.dart';
export 'material_input/material_input_error_keys.dart';
export 'material_input/material_input_multiline.dart';
export 'material_input/material_number_accessor.dart';
export 'material_input/material_number_validators.dart';
export 'material_input/material_percent_directive.dart';
export 'material_list/material_list.dart';
export 'material_list/material_list_item.dart';
export 'material_list/material_list_size.dart';
export 'material_popup/material_popup.dart';
export 'material_progress/material_progress.dart';
export 'material_radio/material_radio.dart';
export 'material_radio/material_radio_group.dart';
export 'material_ripple/material_ripple.dart';
export 'material_select/activation_handler.dart';
export 'material_select/display_name.dart';
export 'material_select/dropdown_button.dart';
export 'material_select/material_dropdown_select.dart';
export 'material_select/material_select.dart';
export 'material_select/material_select_base.dart';
export 'material_select/material_select_dropdown_item.dart';
export 'material_select/material_select_item.dart';
export 'material_select/material_select_searchbox.dart';
export 'material_select/shift_click_selection.dart';
export 'material_spinner/material_spinner.dart';
export 'material_tab/fixed_material_tab_strip.dart';
export 'material_tab/material_tab.dart';
export 'material_tab/material_tab_panel.dart';
export 'material_tab/tab_button.dart';
export 'material_tab/tab_change_event.dart';
export 'material_tab/tab_mixin.dart';
export 'material_toggle/material_toggle.dart';
export 'material_tooltip/material_tooltip.dart';
export 'material_tooltip/module.dart';
export 'material_tree/material_tree.dart';
export 'material_yes_no_buttons/material_yes_no_buttons.dart';
export 'mixins/button_wrapper.dart';
export 'mixins/focusable_mixin.dart';
export 'mixins/has_tab_index.dart';
export 'mixins/highlight_assistant_mixin.dart';
export 'mixins/material_dropdown_base.dart';
export 'mixins/track_layout_changes.dart';
export 'reorder_list/reorder_events.dart';
export 'reorder_list/reorder_list.dart';
export 'scorecard/scoreboard.dart';
export 'scorecard/scorecard.dart';
export 'stop_propagation/stop_propagation.dart';
export 'theme/dark_theme.dart';
export 'theme/module.dart';
export 'laminate/components/modal/modal.dart';
export 'laminate/enums/alignment.dart';
export 'laminate/overlay/module.dart';
export 'laminate/popup/module.dart';
export 'laminate/popup/popup.dart';
export 'model/selection/select.dart';
export 'model/selection/selection_model.dart';
export 'model/selection/selection_options.dart';
export 'model/selection/src/interfaces/selectable.dart';
export 'model/selection/string_selection_options.dart';
export 'model/ui/display_name.dart';
export 'model/ui/has_renderer.dart';
export 'model/ui/icon.dart';
export 'utils/async/async.dart';

/// A convenience list of all Directives exposed by this package.
const List<dynamic> materialDirectives = const [
  AutoDismissDirective,
  AutoFocusDirective,
  ButtonDirective,
  CachingDeferredContentDirective,
  CheckNonNegativeValidator,
  ClickableTooltipTargetDirective,
  DarkThemeDirective,
  DeferredContentDirective,
  displayNameRendererDirective,
  DropdownButtonComponent,
  DynamicComponent,
  FixedMaterialTabStripComponent,
  FocusActivableItemDirective,
  FocusItemDirective,
  FocusListDirective,
  FocusableDirective,
  FocusTrapComponent,
  GlyphComponent,
  HighlightedTextComponent,
  HighlightedValueComponent,
  KeyboardOnlyFocusIndicatorDirective,
  LowerBoundValidator,
  MaterialAutoSuggestInputComponent,
  MaterialButtonComponent,
  MaterialButtonBase,
  MaterialCheckboxComponent,
  MaterialChipComponent,
  MaterialChipsComponent,
  MaterialDialogComponent,
  MaterialDropdownSelectComponent,
  MaterialExpansionPanel,
  MaterialExpansionPanelAutoDismiss,
  MaterialExpansionPanelSet,
  MaterialFabComponent,
  MaterialIconComponent,
  MaterialIconTooltipComponent,
  MaterialInkTooltipComponent,
  MaterialInputComponent,
  MaterialInputDefaultValueAccessor,
  MaterialListComponent,
  MaterialListItemComponent,
  MaterialMultilineInputComponent,
  MaterialPaperTooltipComponent,
  MaterialPercentInputDirective,
  MaterialPersistentDrawerDirective,
  MaterialPopupComponent,
  MaterialProgressComponent,
  MaterialRadioComponent,
  MaterialRadioGroupComponent,
  MaterialRippleComponent,
  MaterialSelectComponent,
  MaterialSelectDropdownItemComponent,
  MaterialSelectItemComponent,
  MaterialSelectSearchboxComponent,
  MaterialSpinnerComponent,
  MaterialTabComponent,
  MaterialTabPanelComponent,
  MaterialTemporaryDrawerComponent,
  MaterialTreeComponent,
  MaterialTreeDropdownComponent,
  MaterialToggleComponent,
  MaterialTooltipDirective,
  MaterialTooltipSourceDirective,
  MaterialTooltipTargetDirective,
  MaterialYesNoButtonsComponent,
  ModalComponent,
  NgModel,
  PositiveNumValidator,
  PopupSourceDirective,
  ReorderItemDirective,
  ReorderListComponent,
  ScoreboardComponent,
  ScorecardComponent,
  StopPropagationDirective,
  TabButtonComponent,
  UpperBoundValidator,
];

/// A convenience list of all providers exposed by this package.
const List<List<Provider>> materialProviders = const <List<Provider>>[
  popupBindings,
];
