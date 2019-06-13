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

module Google
  module Ads
    module GoogleAds
      module V1
        module Enums
          # Container for enum describing where on the first search results page the
          # automated bidding system should target impressions for the
          # TargetImpressionShare bidding strategy.
          class TargetImpressionShareLocationEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible goals.
            module TargetImpressionShareLocation
              # Not specified.
              UNSPECIFIED = 0

              # Used for return value only. Represents value unknown in this version.
              UNKNOWN = 1

              # Any location on the web page.
              ANYWHERE_ON_PAGE = 2

              # Top box of ads.
              TOP_OF_PAGE = 3

              # Top slot in the top box of ads.
              ABSOLUTE_TOP_OF_PAGE = 4
            end
          end
        end
      end
    end
  end
end