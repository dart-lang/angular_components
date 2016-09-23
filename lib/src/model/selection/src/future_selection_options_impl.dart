// Copyright 2016 Google Inc.
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of angular2_components.model.selection.selection_options;

class _FutureSelectionOptions<T> extends SelectionOptions<T> {
  _FutureSelectionOptions(Future<List<OptionGroup<T>>> optionGroupListFuture)
      : super([]) {
    optionGroupListFuture.then(_setOptions);
  }
}