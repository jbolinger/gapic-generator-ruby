# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/showcase/v1beta1/testing_pb"
require "google/showcase/v1beta1/testing_services_pb"
require "google/showcase/v1beta1/testing"

class Google::Showcase::V1beta1::Testing::ClientTest < Minitest::Test
  def setup
    @test_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    @mock_stub = MiniTest::Mock.new
    @response = {}
    @options = {}
  end

  def test_create_session
    # Create request parameters
    session = {}

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do
        @mock_stub.expect :call_rpc, @response do |name, request, options|
          has_name = name == :create_session
          has_options = !options.nil?
          has_fields =
            Gapic::Protobuf.coerce({}, to: Google::Showcase::V1beta1::Session) == request.session

          puts "invalid method call: #{name} (expected create_session)" unless has_name
          puts "invalid options: #{options} vs #{@options}" unless has_options
          puts "invalid fields" unless has_fields

          has_name && has_options && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.create_session session: session
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.create_session(Google::Showcase::V1beta1::CreateSessionRequest.new(
                                         session: session
                                       ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.create_session request = { session: session }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.create_session request = Google::Showcase::V1beta1::CreateSessionRequest.new(
        session: session
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.create_session({ session: session }, @options)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.create_session(Google::Showcase::V1beta1::CreateSessionRequest.new(
                                         session: session
                                       ), @options)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.create_session request = { session: session }, options = @options
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.create_session request = Google::Showcase::V1beta1::CreateSessionRequest.new(
        session: session
      ), options = @options
      assert_equal @response, response
    end
  end

  def test_get_session
    # Create request parameters
    name = "hello world"

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do
        @mock_stub.expect :call_rpc, @response do |name, request, options|
          has_name = name == :get_session
          has_options = !options.nil?
          has_fields =
            request.name == "hello world"

          puts "invalid method call: #{name} (expected get_session)" unless has_name
          puts "invalid options: #{options} vs #{@options}" unless has_options
          puts "invalid fields" unless has_fields

          has_name && has_options && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.get_session name: name
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.get_session(Google::Showcase::V1beta1::GetSessionRequest.new(
                                      name: name
                                    ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.get_session request = { name: name }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.get_session request = Google::Showcase::V1beta1::GetSessionRequest.new(
        name: name
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.get_session({ name: name }, @options)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.get_session(Google::Showcase::V1beta1::GetSessionRequest.new(
                                      name: name
                                    ), @options)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.get_session request = { name: name }, options = @options
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.get_session request = Google::Showcase::V1beta1::GetSessionRequest.new(
        name: name
      ), options = @options
      assert_equal @response, response
    end
  end

  def test_list_sessions
    # Create request parameters
    page_size = 42
    page_token = "hello world"

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do
        @mock_stub.expect :call_rpc, @response do |name, request, options|
          has_name = name == :list_sessions
          has_options = !options.nil?
          has_fields =
            request.page_size == 42 &&

            request.page_token == "hello world"

          puts "invalid method call: #{name} (expected list_sessions)" unless has_name
          puts "invalid options: #{options} vs #{@options}" unless has_options
          puts "invalid fields" unless has_fields

          has_name && has_options && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.list_sessions page_size: page_size, page_token: page_token
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.list_sessions(Google::Showcase::V1beta1::ListSessionsRequest.new(
                                        page_size: page_size, page_token: page_token
                                      ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.list_sessions request = { page_size: page_size, page_token: page_token }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.list_sessions request = Google::Showcase::V1beta1::ListSessionsRequest.new(
        page_size: page_size, page_token: page_token
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.list_sessions({ page_size: page_size, page_token: page_token }, @options)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.list_sessions(Google::Showcase::V1beta1::ListSessionsRequest.new(
                                        page_size: page_size, page_token: page_token
                                      ), @options)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.list_sessions request = { page_size: page_size, page_token: page_token }, options = @options
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.list_sessions request = Google::Showcase::V1beta1::ListSessionsRequest.new(
        page_size: page_size, page_token: page_token
      ), options = @options
      assert_equal @response, response
    end
  end

  def test_delete_session
    # Create request parameters
    name = "hello world"

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do
        @mock_stub.expect :call_rpc, @response do |name, request, options|
          has_name = name == :delete_session
          has_options = !options.nil?
          has_fields =
            request.name == "hello world"

          puts "invalid method call: #{name} (expected delete_session)" unless has_name
          puts "invalid options: #{options} vs #{@options}" unless has_options
          puts "invalid fields" unless has_fields

          has_name && has_options && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.delete_session name: name
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.delete_session(Google::Showcase::V1beta1::DeleteSessionRequest.new(
                                         name: name
                                       ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.delete_session request = { name: name }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.delete_session request = Google::Showcase::V1beta1::DeleteSessionRequest.new(
        name: name
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.delete_session({ name: name }, @options)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.delete_session(Google::Showcase::V1beta1::DeleteSessionRequest.new(
                                         name: name
                                       ), @options)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.delete_session request = { name: name }, options = @options
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.delete_session request = Google::Showcase::V1beta1::DeleteSessionRequest.new(
        name: name
      ), options = @options
      assert_equal @response, response
    end
  end

  def test_report_session
    # Create request parameters
    name = "hello world"

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do
        @mock_stub.expect :call_rpc, @response do |name, request, options|
          has_name = name == :report_session
          has_options = !options.nil?
          has_fields =
            request.name == "hello world"

          puts "invalid method call: #{name} (expected report_session)" unless has_name
          puts "invalid options: #{options} vs #{@options}" unless has_options
          puts "invalid fields" unless has_fields

          has_name && has_options && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.report_session name: name
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.report_session(Google::Showcase::V1beta1::ReportSessionRequest.new(
                                         name: name
                                       ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.report_session request = { name: name }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.report_session request = Google::Showcase::V1beta1::ReportSessionRequest.new(
        name: name
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.report_session({ name: name }, @options)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.report_session(Google::Showcase::V1beta1::ReportSessionRequest.new(
                                         name: name
                                       ), @options)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.report_session request = { name: name }, options = @options
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.report_session request = Google::Showcase::V1beta1::ReportSessionRequest.new(
        name: name
      ), options = @options
      assert_equal @response, response
    end
  end

  def test_list_tests
    # Create request parameters
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do
        @mock_stub.expect :call_rpc, @response do |name, request, options|
          has_name = name == :list_tests
          has_options = !options.nil?
          has_fields =
            request.parent == "hello world" &&

            request.page_size == 42 &&

            request.page_token == "hello world"

          puts "invalid method call: #{name} (expected list_tests)" unless has_name
          puts "invalid options: #{options} vs #{@options}" unless has_options
          puts "invalid fields" unless has_fields

          has_name && has_options && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.list_tests parent: parent, page_size: page_size, page_token: page_token
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.list_tests(Google::Showcase::V1beta1::ListTestsRequest.new(
                                     parent: parent, page_size: page_size, page_token: page_token
                                   ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.list_tests request = { parent: parent, page_size: page_size, page_token: page_token }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.list_tests request = Google::Showcase::V1beta1::ListTestsRequest.new(
        parent: parent, page_size: page_size, page_token: page_token
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.list_tests({ parent: parent, page_size: page_size, page_token: page_token }, @options)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.list_tests(Google::Showcase::V1beta1::ListTestsRequest.new(
                                     parent: parent, page_size: page_size, page_token: page_token
                                   ), @options)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.list_tests request = { parent: parent, page_size: page_size, page_token: page_token }, options = @options
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.list_tests request = Google::Showcase::V1beta1::ListTestsRequest.new(
        parent: parent, page_size: page_size, page_token: page_token
      ), options = @options
      assert_equal @response, response
    end
  end

  def test_delete_test
    # Create request parameters
    name = "hello world"

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do
        @mock_stub.expect :call_rpc, @response do |name, request, options|
          has_name = name == :delete_test
          has_options = !options.nil?
          has_fields =
            request.name == "hello world"

          puts "invalid method call: #{name} (expected delete_test)" unless has_name
          puts "invalid options: #{options} vs #{@options}" unless has_options
          puts "invalid fields" unless has_fields

          has_name && has_options && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.delete_test name: name
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.delete_test(Google::Showcase::V1beta1::DeleteTestRequest.new(
                                      name: name
                                    ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.delete_test request = { name: name }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.delete_test request = Google::Showcase::V1beta1::DeleteTestRequest.new(
        name: name
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.delete_test({ name: name }, @options)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.delete_test(Google::Showcase::V1beta1::DeleteTestRequest.new(
                                      name: name
                                    ), @options)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.delete_test request = { name: name }, options = @options
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.delete_test request = Google::Showcase::V1beta1::DeleteTestRequest.new(
        name: name
      ), options = @options
      assert_equal @response, response
    end
  end

  def test_verify_test
    # Create request parameters
    name = "hello world"
    answer = "hello world"
    answers = ["hello world"]

    Gapic::ServiceStub.stub :new, @mock_stub do
      # Create client
      client = Google::Showcase::V1beta1::Testing::Client.new do |config|
        config.credentials = @test_channel
      end

      8.times do
        @mock_stub.expect :call_rpc, @response do |name, request, options|
          has_name = name == :verify_test
          has_options = !options.nil?
          has_fields =
            request.name == "hello world" &&

            request.answer == "hello world" &&

            request.answers == ["hello world"]

          puts "invalid method call: #{name} (expected verify_test)" unless has_name
          puts "invalid options: #{options} vs #{@options}" unless has_options
          puts "invalid fields" unless has_fields

          has_name && has_options && has_fields
        end
      end

      # Call method (positional / hash)
      response = client.verify_test name: name, answer: answer, answers: answers
      assert_equal @response, response

      # Call method (positional / protobuf type)
      response = client.verify_test(Google::Showcase::V1beta1::VerifyTestRequest.new(
                                      name: name, answer: answer, answers: answers
                                    ))
      assert_equal @response, response

      # Call method (named / hash)
      response = client.verify_test request = { name: name, answer: answer, answers: answers }
      assert_equal @response, response

      # Call method (named / protobuf type)
      response = client.verify_test request = Google::Showcase::V1beta1::VerifyTestRequest.new(
        name: name, answer: answer, answers: answers
      )
      assert_equal @response, response

      # Call method with options (positional / hash)
      response = client.verify_test({ name: name, answer: answer, answers: answers }, @options)
      assert_equal @response, response

      # Call method with options (positional / protobuf type)
      response = client.verify_test(Google::Showcase::V1beta1::VerifyTestRequest.new(
                                      name: name, answer: answer, answers: answers
                                    ), @options)
      assert_equal @response, response

      # Call method with options (named / hash)
      response = client.verify_test request = { name: name, answer: answer, answers: answers }, options = @options
      assert_equal @response, response

      # Call method with options (named / protobuf type)
      response = client.verify_test request = Google::Showcase::V1beta1::VerifyTestRequest.new(
        name: name, answer: answer, answers: answers
      ), options = @options
      assert_equal @response, response
    end
  end
end
