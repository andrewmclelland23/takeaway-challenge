##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class ConferenceContext < InstanceContext
            class ParticipantList < ListResource
              ##
              # Initialize the ParticipantList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
              #   Participant resource.
              # @param [String] conference_sid The SID of the conference the participant is in.
              # @return [ParticipantList] ParticipantList
              def initialize(version, account_sid: nil, conference_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, conference_sid: conference_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:conference_sid]}/Participants.json"
              end

              ##
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [String] from The `from` phone number that will dial the new conference
              #   participant. Can be a phone number or a client id.
              # @param [String] to The phone number, client id, or sip address to invite to the
              #   conference.
              # @param [String] status_callback The URL we should call using the
              #   `status_callback_method` to send status information to your application.
              # @param [String] status_callback_method The HTTP method we should use to call
              #   `status_callback`. Can be: `GET` and `POST` and defaults to `POST`.
              # @param [String] status_callback_event The conference state changes that should
              #   generate a call to `status_callback`. Can be: `initiated`, `ringing`,
              #   `answered`, and `completed`. Separate multiple values with a space. The default
              #   value is `completed`.
              # @param [String] timeout The number of seconds that we should allow the phone to
              #   ring before assuming there is no answer. Can be an integer between `5` and
              #   `600`, inclusive. The default value is `60`. We always add a 5-second timeout
              #   buffer to outgoing calls, so  value of 10 would result in an actual timeout that
              #   was closer to 15 seconds.
              # @param [Boolean] record Whether to record the participant and their conferences,
              #   including the time between conferences. Can be `true` or `false` and the default
              #   is `false`.
              # @param [Boolean] muted Whether the agent is muted in the conference. Can be
              #   `true` or `false` and the default is `false`.
              # @param [String] beep Whether to play a notification beep to the conference when
              #   the participant joins. Can be: `true`, `false`, `onEnter`, or `onExit`. The
              #   default value is `true`.
              # @param [Boolean] start_conference_on_enter Whether to start the conference when
              #   the participant joins, if it has not already started. Can be: `true` or `false`
              #   and the default is `true`. If `false` and the conference has not started, the
              #   participant is muted and hears background music until another participant starts
              #   the conference.
              # @param [Boolean] end_conference_on_exit Whether to end the conference when the
              #   participant leaves. Can be: `true` or `false` and defaults to `false`.
              # @param [String] wait_url The URL we should call using the `wait_method` for the
              #   music to play while participants are waiting for the conference to start. The
              #   default value is the URL of our standard hold music. [Learn more about hold
              #   music](https://www.twilio.com/labs/twimlets/holdmusic).
              # @param [String] wait_method The HTTP method we should use to call `wait_url`.
              #   Can be `GET` or `POST` and the default is `POST`. When using a static audio
              #   file, this should be `GET` so that we can cache the file.
              # @param [Boolean] early_media Whether to allow an agent to hear the state of the
              #   outbound call, including ringing or disconnect messages. Can be: `true` or
              #   `false` and defaults to `true`.
              # @param [String] max_participants The maximum number of participants in the
              #   conference. Can be a positive integer from `2` to `10`. The default value is
              #   `10`.
              # @param [String] conference_record Whether to record the conference the
              #   participant is joining. Can be: `true`, `false`, `record-from-start`, and
              #   `do-not-record`. The default value is `false`.
              # @param [String] conference_trim Whether to trim leading and trailing silence
              #   from your recorded conference audio files. Can be: `trim-silence` or
              #   `do-not-trim` and defaults to `trim-silence`.
              # @param [String] conference_status_callback The URL we should call using the
              #   `conference_status_callback_method` when the conference events in
              #   `conference_status_callback_event` occur. Only the value set by the first
              #   participant to join the conference is used. Subsequent
              #   `conference_status_callback` values are ignored.
              # @param [String] conference_status_callback_method The HTTP method we should use
              #   to call `conference_status_callback`. Can be: `GET` or `POST` and defaults to
              #   `POST`.
              # @param [String] conference_status_callback_event The conference state changes
              #   that should generate a call to `conference_status_callback`. Can be: `start`,
              #   `end`, `join`, `leave`, `mute`, `hold`, and `speaker`. Separate multiple values
              #   with a space. Defaults to `start end`.
              # @param [String] recording_channels The recording channels for the final
              #   recording. Can be: `mono` or `dual` and the default is `mono`.
              # @param [String] recording_status_callback The URL that we should call using the
              #   `recording_status_callback_method` when the recording status changes.
              # @param [String] recording_status_callback_method The HTTP method we should use
              #   when we call `recording_status_callback`. Can be: `GET` or `POST` and defaults
              #   to `POST`.
              # @param [String] sip_auth_username The SIP username used for authentication.
              # @param [String] sip_auth_password The SIP password for authentication.
              # @param [String] region The
              #   [region](https://support.twilio.com/hc/en-us/articles/223132167-How-global-low-latency-routing-and-region-selection-work-for-conferences-and-Client-calls) where we should mix the recorded audio. Can be:`us1`, `ie1`, `de1`, `sg1`, `br1`, `au1`, or `jp1`.
              # @param [String] conference_recording_status_callback The URL we should call
              #   using the `conference_recording_status_callback_method` when the conference
              #   recording is available.
              # @param [String] conference_recording_status_callback_method The HTTP method we
              #   should use to call `conference_recording_status_callback`. Can be: `GET` or
              #   `POST` and defaults to `POST`.
              # @param [String] recording_status_callback_event The recording state changes that
              #   should generate a call to `recording_status_callback`. Can be: `in-progress`,
              #   `completed`, and `failed`. Separate multiple values with a space. The default
              #   value is `in-progress completed failed`.
              # @param [String] conference_recording_status_callback_event The conference
              #   recording state changes that generate a call to
              #   `conference_recording_status_callback`. Can be: `in-progress`, `completed`, and
              #   `failed`. Separate multiple values with a space. The default value is
              #   `in-progress completed failed`.
              # @param [Boolean] coaching Whether the participant is coaching another call. Can
              #   be: `true` or `false`. If not present, defaults to `false` unless
              #   `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined.
              # @param [String] call_sid_to_coach The SID of the participant who is being
              #   `coached`. The participant being coached is the only participant who can hear
              #   the participant who is `coaching`.
              # @return [ParticipantInstance] Newly created ParticipantInstance
              def create(from: nil, to: nil, status_callback: :unset, status_callback_method: :unset, status_callback_event: :unset, timeout: :unset, record: :unset, muted: :unset, beep: :unset, start_conference_on_enter: :unset, end_conference_on_exit: :unset, wait_url: :unset, wait_method: :unset, early_media: :unset, max_participants: :unset, conference_record: :unset, conference_trim: :unset, conference_status_callback: :unset, conference_status_callback_method: :unset, conference_status_callback_event: :unset, recording_channels: :unset, recording_status_callback: :unset, recording_status_callback_method: :unset, sip_auth_username: :unset, sip_auth_password: :unset, region: :unset, conference_recording_status_callback: :unset, conference_recording_status_callback_method: :unset, recording_status_callback_event: :unset, conference_recording_status_callback_event: :unset, coaching: :unset, call_sid_to_coach: :unset)
                data = Twilio::Values.of({
                    'From' => from,
                    'To' => to,
                    'StatusCallback' => status_callback,
                    'StatusCallbackMethod' => status_callback_method,
                    'StatusCallbackEvent' => Twilio.serialize_list(status_callback_event) { |e| e },
                    'Timeout' => timeout,
                    'Record' => record,
                    'Muted' => muted,
                    'Beep' => beep,
                    'StartConferenceOnEnter' => start_conference_on_enter,
                    'EndConferenceOnExit' => end_conference_on_exit,
                    'WaitUrl' => wait_url,
                    'WaitMethod' => wait_method,
                    'EarlyMedia' => early_media,
                    'MaxParticipants' => max_participants,
                    'ConferenceRecord' => conference_record,
                    'ConferenceTrim' => conference_trim,
                    'ConferenceStatusCallback' => conference_status_callback,
                    'ConferenceStatusCallbackMethod' => conference_status_callback_method,
                    'ConferenceStatusCallbackEvent' => Twilio.serialize_list(conference_status_callback_event) { |e| e },
                    'RecordingChannels' => recording_channels,
                    'RecordingStatusCallback' => recording_status_callback,
                    'RecordingStatusCallbackMethod' => recording_status_callback_method,
                    'SipAuthUsername' => sip_auth_username,
                    'SipAuthPassword' => sip_auth_password,
                    'Region' => region,
                    'ConferenceRecordingStatusCallback' => conference_recording_status_callback,
                    'ConferenceRecordingStatusCallbackMethod' => conference_recording_status_callback_method,
                    'RecordingStatusCallbackEvent' => Twilio.serialize_list(recording_status_callback_event) { |e| e },
                    'ConferenceRecordingStatusCallbackEvent' => Twilio.serialize_list(conference_recording_status_callback_event) { |e| e },
                    'Coaching' => coaching,
                    'CallSidToCoach' => call_sid_to_coach,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                )
              end

              ##
              # Lists ParticipantInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Boolean] muted Whether to return only participants that are muted. Can
              #   be: `true` or `false`.
              # @param [Boolean] hold Whether to return only participants that are on hold. Can
              #   be: `true` or `false`.
              # @param [Boolean] coaching Whether to return only participants who are coaching
              #   another call. Can be: `true` or `false`.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(muted: :unset, hold: :unset, coaching: :unset, limit: nil, page_size: nil)
                self.stream(
                    muted: muted,
                    hold: hold,
                    coaching: coaching,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams ParticipantInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Boolean] muted Whether to return only participants that are muted. Can
              #   be: `true` or `false`.
              # @param [Boolean] hold Whether to return only participants that are on hold. Can
              #   be: `true` or `false`.
              # @param [Boolean] coaching Whether to return only participants who are coaching
              #   another call. Can be: `true` or `false`.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(muted: :unset, hold: :unset, coaching: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(muted: muted, hold: hold, coaching: coaching, page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields ParticipantInstance records from the API.
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
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [Boolean] muted Whether to return only participants that are muted. Can
              #   be: `true` or `false`.
              # @param [Boolean] hold Whether to return only participants that are on hold. Can
              #   be: `true` or `false`.
              # @param [Boolean] coaching Whether to return only participants who are coaching
              #   another call. Can be: `true` or `false`.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of ParticipantInstance
              def page(muted: :unset, hold: :unset, coaching: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'Muted' => muted,
                    'Hold' => hold,
                    'Coaching' => coaching,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                ParticipantPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of ParticipantInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                ParticipantPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.ParticipantList>'
              end
            end

            class ParticipantPage < Page
              ##
              # Initialize the ParticipantPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [ParticipantPage] ParticipantPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of ParticipantInstance
              # @param [Hash] payload Payload response from the API
              # @return [ParticipantInstance] ParticipantInstance
              def get_instance(payload)
                ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.ParticipantPage>'
              end
            end

            class ParticipantContext < InstanceContext
              ##
              # Initialize the ParticipantContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
              #   Participant resource to fetch.
              # @param [String] conference_sid The SID of the conference with the participant to
              #   fetch.
              # @param [String] call_sid The [Call](https://www.twilio.com/docs/api/voice/call)
              #   SID of the resource to fetch.
              # @return [ParticipantContext] ParticipantContext
              def initialize(version, account_sid, conference_sid, call_sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, conference_sid: conference_sid, call_sid: call_sid, }
                @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:conference_sid]}/Participants/#{@solution[:call_sid]}.json"
              end

              ##
              # Fetch a ParticipantInstance
              # @return [ParticipantInstance] Fetched ParticipantInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Update the ParticipantInstance
              # @param [Boolean] muted Whether the participant should be muted. Can be `true` or
              #   `false. `true` will mute the participant, and `false` will un-mute them.
              #   Anything value other than `true` or `false` is interpreted as `false`.
              # @param [Boolean] hold Whether the participant should be on hold. Can be: `true`
              #   or `false`. `true` puts the participant on hold, and `false` lets them rejoin
              #   the conference.
              # @param [String] hold_url The URL we call using the `hold_method` for  music that
              #   plays when the participant is on hold. The URL may return an MP3 file, a WAV
              #   file, or a TwiML document that contains the `<Play>`, `<Say>` or `<Redirect>`
              #   commands.
              # @param [String] hold_method The HTTP method we should use to call `hold_url`.
              #   Can be: `GET` or `POST` and the default is `GET`.
              # @param [String] announce_url The URL we call using the `announce_method` for an
              #   announcement to the participant. The URL must return an MP3 file, a WAV file, or
              #   a TwiML document that contains `<Play>` or `<Say>` commands.
              # @param [String] announce_method The HTTP method we should use to call
              #   `announce_url`. Can be: `GET` or `POST` and defaults to `POST`.
              # @param [String] wait_url The URL we should call using the `wait_method` for the
              #   music to play while participants are waiting for the conference to start. The
              #   default value is the URL of our standard hold music. [Learn more about hold
              #   music](https://www.twilio.com/labs/twimlets/holdmusic).
              # @param [String] wait_method The HTTP method we should use to call `wait_url`.
              #   Can be `GET` or `POST` and the default is `POST`. When using a static audio
              #   file, this should be `GET` so that we can cache the file.
              # @param [Boolean] beep_on_exit Whether to play a notification beep to the
              #   conference when the participant exits. Can be: `true` or `false`.
              # @param [Boolean] end_conference_on_exit Whether to end the conference when the
              #   participant leaves. Can be: `true` or `false` and defaults to `false`.
              # @param [Boolean] coaching Whether the participant is coaching another call. Can
              #   be: `true` or `false`. If not present, defaults to `false` unless
              #   `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined.
              # @param [String] call_sid_to_coach The SID of the participant who is being
              #   `coached`. The participant being coached is the only participant who can hear
              #   the participant who is `coaching`.
              # @return [ParticipantInstance] Updated ParticipantInstance
              def update(muted: :unset, hold: :unset, hold_url: :unset, hold_method: :unset, announce_url: :unset, announce_method: :unset, wait_url: :unset, wait_method: :unset, beep_on_exit: :unset, end_conference_on_exit: :unset, coaching: :unset, call_sid_to_coach: :unset)
                data = Twilio::Values.of({
                    'Muted' => muted,
                    'Hold' => hold,
                    'HoldUrl' => hold_url,
                    'HoldMethod' => hold_method,
                    'AnnounceUrl' => announce_url,
                    'AnnounceMethod' => announce_method,
                    'WaitUrl' => wait_url,
                    'WaitMethod' => wait_method,
                    'BeepOnExit' => beep_on_exit,
                    'EndConferenceOnExit' => end_conference_on_exit,
                    'Coaching' => coaching,
                    'CallSidToCoach' => call_sid_to_coach,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Deletes the ParticipantInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.ParticipantContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.ParticipantContext #{context}>"
              end
            end

            class ParticipantInstance < InstanceResource
              ##
              # Initialize the ParticipantInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The SID of the
              #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
              #   Participant resource.
              # @param [String] conference_sid The SID of the conference the participant is in.
              # @param [String] call_sid The [Call](https://www.twilio.com/docs/api/voice/call)
              #   SID of the resource to fetch.
              # @return [ParticipantInstance] ParticipantInstance
              def initialize(version, payload, account_sid: nil, conference_sid: nil, call_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'call_sid' => payload['call_sid'],
                    'call_sid_to_coach' => payload['call_sid_to_coach'],
                    'coaching' => payload['coaching'],
                    'conference_sid' => payload['conference_sid'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'end_conference_on_exit' => payload['end_conference_on_exit'],
                    'muted' => payload['muted'],
                    'hold' => payload['hold'],
                    'start_conference_on_enter' => payload['start_conference_on_enter'],
                    'status' => payload['status'],
                    'uri' => payload['uri'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'conference_sid' => conference_sid,
                    'call_sid' => call_sid || @properties['call_sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [ParticipantContext] ParticipantContext for this ParticipantInstance
              def context
                unless @instance_context
                  @instance_context = ParticipantContext.new(
                      @version,
                      @params['account_sid'],
                      @params['conference_sid'],
                      @params['call_sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The SID of the Call the resource is associated with
              def call_sid
                @properties['call_sid']
              end

              ##
              # @return [String] The SID of the participant who is being `coached`
              def call_sid_to_coach
                @properties['call_sid_to_coach']
              end

              ##
              # @return [Boolean] Indicates if the participant changed to coach
              def coaching
                @properties['coaching']
              end

              ##
              # @return [String] The SID of the conference the participant is in
              def conference_sid
                @properties['conference_sid']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that the resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that the resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [Boolean] Whether the conference ends when the participant leaves
              def end_conference_on_exit
                @properties['end_conference_on_exit']
              end

              ##
              # @return [Boolean] Whether the participant is muted
              def muted
                @properties['muted']
              end

              ##
              # @return [Boolean] Whether the participant is on hold
              def hold
                @properties['hold']
              end

              ##
              # @return [Boolean] Whether the conference starts when the participant joins the conference
              def start_conference_on_enter
                @properties['start_conference_on_enter']
              end

              ##
              # @return [participant.Status] The status of the participant's call in a session
              def status
                @properties['status']
              end

              ##
              # @return [String] The URI of the resource, relative to `https://api.twilio.com`
              def uri
                @properties['uri']
              end

              ##
              # Fetch a ParticipantInstance
              # @return [ParticipantInstance] Fetched ParticipantInstance
              def fetch
                context.fetch
              end

              ##
              # Update the ParticipantInstance
              # @param [Boolean] muted Whether the participant should be muted. Can be `true` or
              #   `false. `true` will mute the participant, and `false` will un-mute them.
              #   Anything value other than `true` or `false` is interpreted as `false`.
              # @param [Boolean] hold Whether the participant should be on hold. Can be: `true`
              #   or `false`. `true` puts the participant on hold, and `false` lets them rejoin
              #   the conference.
              # @param [String] hold_url The URL we call using the `hold_method` for  music that
              #   plays when the participant is on hold. The URL may return an MP3 file, a WAV
              #   file, or a TwiML document that contains the `<Play>`, `<Say>` or `<Redirect>`
              #   commands.
              # @param [String] hold_method The HTTP method we should use to call `hold_url`.
              #   Can be: `GET` or `POST` and the default is `GET`.
              # @param [String] announce_url The URL we call using the `announce_method` for an
              #   announcement to the participant. The URL must return an MP3 file, a WAV file, or
              #   a TwiML document that contains `<Play>` or `<Say>` commands.
              # @param [String] announce_method The HTTP method we should use to call
              #   `announce_url`. Can be: `GET` or `POST` and defaults to `POST`.
              # @param [String] wait_url The URL we should call using the `wait_method` for the
              #   music to play while participants are waiting for the conference to start. The
              #   default value is the URL of our standard hold music. [Learn more about hold
              #   music](https://www.twilio.com/labs/twimlets/holdmusic).
              # @param [String] wait_method The HTTP method we should use to call `wait_url`.
              #   Can be `GET` or `POST` and the default is `POST`. When using a static audio
              #   file, this should be `GET` so that we can cache the file.
              # @param [Boolean] beep_on_exit Whether to play a notification beep to the
              #   conference when the participant exits. Can be: `true` or `false`.
              # @param [Boolean] end_conference_on_exit Whether to end the conference when the
              #   participant leaves. Can be: `true` or `false` and defaults to `false`.
              # @param [Boolean] coaching Whether the participant is coaching another call. Can
              #   be: `true` or `false`. If not present, defaults to `false` unless
              #   `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined.
              # @param [String] call_sid_to_coach The SID of the participant who is being
              #   `coached`. The participant being coached is the only participant who can hear
              #   the participant who is `coaching`.
              # @return [ParticipantInstance] Updated ParticipantInstance
              def update(muted: :unset, hold: :unset, hold_url: :unset, hold_method: :unset, announce_url: :unset, announce_method: :unset, wait_url: :unset, wait_method: :unset, beep_on_exit: :unset, end_conference_on_exit: :unset, coaching: :unset, call_sid_to_coach: :unset)
                context.update(
                    muted: muted,
                    hold: hold,
                    hold_url: hold_url,
                    hold_method: hold_method,
                    announce_url: announce_url,
                    announce_method: announce_method,
                    wait_url: wait_url,
                    wait_method: wait_method,
                    beep_on_exit: beep_on_exit,
                    end_conference_on_exit: end_conference_on_exit,
                    coaching: coaching,
                    call_sid_to_coach: call_sid_to_coach,
                )
              end

              ##
              # Deletes the ParticipantInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.ParticipantInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.ParticipantInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end