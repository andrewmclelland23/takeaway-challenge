##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class Understand < Version
        class AssistantContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class QueryList < ListResource
            ##
            # Initialize the QueryList
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The unique ID of the parent Assistant.
            # @return [QueryList] QueryList
            def initialize(version, assistant_sid: nil)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid}
              @uri = "/Assistants/#{@solution[:assistant_sid]}/Queries"
            end

            ##
            # Lists QueryInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] language An ISO language-country string of the sample.
            # @param [String] model_build The Model Build Sid or unique name of the Model
            #   Build to be queried.
            # @param [String] status A string that described the query status. The values can
            #   be: pending_review, reviewed, discarded
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(language: :unset, model_build: :unset, status: :unset, limit: nil, page_size: nil)
              self.stream(
                  language: language,
                  model_build: model_build,
                  status: status,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams QueryInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] language An ISO language-country string of the sample.
            # @param [String] model_build The Model Build Sid or unique name of the Model
            #   Build to be queried.
            # @param [String] status A string that described the query status. The values can
            #   be: pending_review, reviewed, discarded
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(language: :unset, model_build: :unset, status: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  language: language,
                  model_build: model_build,
                  status: status,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields QueryInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of QueryInstance records from the API.
            # Request is executed immediately.
            # @param [String] language An ISO language-country string of the sample.
            # @param [String] model_build The Model Build Sid or unique name of the Model
            #   Build to be queried.
            # @param [String] status A string that described the query status. The values can
            #   be: pending_review, reviewed, discarded
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of QueryInstance
            def page(language: :unset, model_build: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Language' => language,
                  'ModelBuild' => model_build,
                  'Status' => status,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              QueryPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of QueryInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of QueryInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              QueryPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of QueryInstance records from the API.
            # Request is executed immediately.
            # @param [String] language An ISO language-country string of the sample.
            # @param [String] query A user-provided string that uniquely identifies this
            #   resource as an alternative to the sid. It can be up to 2048 characters long.
            # @param [String] tasks Constraints the query to a set of tasks. Useful when you
            #   need to constrain the paths the user can take. Tasks should be comma separated
            #   *task-unique-name-1*, *task-unique-name-2*
            # @param [String] model_build The Model Build Sid or unique name of the Model
            #   Build to be queried.
            # @param [String] field Constraints the query to a given Field with an task.
            #   Useful when you know the Field you are expecting. It accepts one field in the
            #   format *task-unique-name-1*:*field-unique-name*
            # @return [QueryInstance] Newly created QueryInstance
            def create(language: nil, query: nil, tasks: :unset, model_build: :unset, field: :unset)
              data = Twilio::Values.of({
                  'Language' => language,
                  'Query' => query,
                  'Tasks' => tasks,
                  'ModelBuild' => model_build,
                  'Field' => field,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              QueryInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Understand.QueryList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class QueryPage < Page
            ##
            # Initialize the QueryPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [QueryPage] QueryPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of QueryInstance
            # @param [Hash] payload Payload response from the API
            # @return [QueryInstance] QueryInstance
            def get_instance(payload)
              QueryInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Understand.QueryPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class QueryContext < InstanceContext
            ##
            # Initialize the QueryContext
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The unique ID of the Assistant.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [QueryContext] QueryContext
            def initialize(version, assistant_sid, sid)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid, sid: sid, }
              @uri = "/Assistants/#{@solution[:assistant_sid]}/Queries/#{@solution[:sid]}"
            end

            ##
            # Fetch a QueryInstance
            # @return [QueryInstance] Fetched QueryInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              QueryInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], sid: @solution[:sid], )
            end

            ##
            # Update the QueryInstance
            # @param [String] sample_sid An optional reference to the Sample created from this
            #   query.
            # @param [String] status A string that described the query status. The values can
            #   be: pending_review, reviewed, discarded
            # @return [QueryInstance] Updated QueryInstance
            def update(sample_sid: :unset, status: :unset)
              data = Twilio::Values.of({'SampleSid' => sample_sid, 'Status' => status, })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              QueryInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], sid: @solution[:sid], )
            end

            ##
            # Deletes the QueryInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Understand.QueryContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Understand.QueryContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class QueryInstance < InstanceResource
            ##
            # Initialize the QueryInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] assistant_sid The unique ID of the parent Assistant.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [QueryInstance] QueryInstance
            def initialize(version, payload, assistant_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'results' => payload['results'],
                  'language' => payload['language'],
                  'model_build_sid' => payload['model_build_sid'],
                  'query' => payload['query'],
                  'sample_sid' => payload['sample_sid'],
                  'assistant_sid' => payload['assistant_sid'],
                  'sid' => payload['sid'],
                  'status' => payload['status'],
                  'url' => payload['url'],
                  'source_channel' => payload['source_channel'],
              }

              # Context
              @instance_context = nil
              @params = {'assistant_sid' => assistant_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [QueryContext] QueryContext for this QueryInstance
            def context
              unless @instance_context
                @instance_context = QueryContext.new(@version, @params['assistant_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique ID of the Account that created this Query.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Time] The date that this resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [Hash] The natural language analysis results which include the Task recognized, the confidence score and a list of identified Fields.
            def results
              @properties['results']
            end

            ##
            # @return [String] An ISO language-country string of the sample.
            def language
              @properties['language']
            end

            ##
            # @return [String] The unique ID of the Model Build queried.
            def model_build_sid
              @properties['model_build_sid']
            end

            ##
            # @return [String] The end-user's natural language input.
            def query
              @properties['query']
            end

            ##
            # @return [String] An optional reference to the Sample created from this query.
            def sample_sid
              @properties['sample_sid']
            end

            ##
            # @return [String] The unique ID of the parent Assistant.
            def assistant_sid
              @properties['assistant_sid']
            end

            ##
            # @return [String] A 34 character string that uniquely identifies this resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] A string that described the query status. The values can be: pending_review, reviewed, discarded
            def status
              @properties['status']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] The communication channel where this end-user input came from
            def source_channel
              @properties['source_channel']
            end

            ##
            # Fetch a QueryInstance
            # @return [QueryInstance] Fetched QueryInstance
            def fetch
              context.fetch
            end

            ##
            # Update the QueryInstance
            # @param [String] sample_sid An optional reference to the Sample created from this
            #   query.
            # @param [String] status A string that described the query status. The values can
            #   be: pending_review, reviewed, discarded
            # @return [QueryInstance] Updated QueryInstance
            def update(sample_sid: :unset, status: :unset)
              context.update(sample_sid: sample_sid, status: status, )
            end

            ##
            # Deletes the QueryInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.QueryInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.QueryInstance #{values}>"
            end
          end
        end
      end
    end
  end
end