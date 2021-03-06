# frozen_string_literal: true

# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "test_helper"

class MethodPresenterTest < PresenterTest
  def test_garbage_GetSimpleGarbage
    presenter = method_presenter :garbage, "GarbageService", "GetSimpleGarbage"

    assert_equal "get_simple_garbage", presenter.name
    assert_equal :normal, presenter.kind
    assert_nil presenter.doc_description
  end

  def test_garbage_GetSpecificGarbage
    presenter = method_presenter :garbage, "GarbageService", "GetSpecificGarbage"

    assert_equal "get_specific_garbage", presenter.name
    assert_equal :normal, presenter.kind
    assert_nil presenter.doc_description
  end

  def test_garbage_GetNestedGarbage
    presenter = method_presenter :garbage, "GarbageService", "GetNestedGarbage"

    assert_equal "get_nested_garbage", presenter.name
    assert_equal :normal, presenter.kind
    assert_nil presenter.doc_description
  end

  def test_garbage_GetRepeatedGarbage
    presenter = method_presenter :garbage, "GarbageService", "GetRepeatedGarbage"

    assert_equal "get_repeated_garbage", presenter.name
    assert_equal :normal, presenter.kind
    refute presenter.lro?
    assert_nil presenter.doc_description
  end

  def test_garbage_LongRunningGarbage
    presenter = method_presenter :garbage, "GarbageService", "LongRunningGarbage"

    assert_equal "long_running_garbage", presenter.name
    assert_equal :normal, presenter.kind
    assert presenter.lro?
    assert_nil presenter.doc_description
  end

  def test_garbage_ClientGarbage
    presenter = method_presenter :garbage, "GarbageService", "ClientGarbage"

    assert_equal "client_garbage", presenter.name
    assert_equal :client, presenter.kind
    assert_nil presenter.doc_description
  end

  def test_garbage_ServerGarbage
    presenter = method_presenter :garbage, "GarbageService", "ServerGarbage"

    assert_equal "server_garbage", presenter.name
    assert_equal :server, presenter.kind
    assert_nil presenter.doc_description
  end

  def test_garbage_BidiGarbage
    presenter = method_presenter :garbage, "GarbageService", "BidiGarbage"

    assert_equal "bidi_garbage", presenter.name
    assert_equal :bidi, presenter.kind
    assert_nil presenter.doc_description
  end
end
