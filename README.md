# DDDTooling

This is Gem is for ruby projects which are using DDD tactical design. It provides some basic classes.
You can derive from them and stop thinking about some basic redundant implementations.
It also provides some event infrastructure handling.

In the near future there will be examples on how to use it in your project.

## Examples


### Tactical Design Base Classes

#### AggregateRoot

```ruby
class ExampleAggregateRoot < DDDTooling::Aggregate
end
```

#### Entity

```ruby
class ExampleEntity < DDDTooling::Entity
end
```

#### ValueObject

```ruby
class ExampleValueObject < DDDTooling::ValueObject
end
```

#### DomainEvent

provides a `unique_identifer` and a `occured_at` timestamp

```ruby
class ExampleDomainEvent < DDDTooling::Event
end
```

### Event Infrastructure

#### EventStore

It provides a simple event store. You can store and replay events.
It provides the following methods:

- `store(event:)` - stores an event
- `stored_events` - returns all stored events
- `replay_events` - replays all stored events

```ruby
class ExampleEventStore < DDDTooling::Infrastructure::EventStore
end
```

#### EventDispatcher

It provides a simple event dispatcher. You can register event handlers and dispatch events.
You can register event handlers for specific events.
You should use a dependency injection container to register the event dispatcher as a singleton.
It provides the following methods:

- `subscribe(event_class:, subscriber_class:)` - registers a subscriber for a specific event
- `dispatch(event:)` - dispatches an event to all subscribers
- `dispatch_all(events:)` - dispatches all events to all subscribers

```ruby
class ExampleEventDispatcher < DDDTooling::Infrastructure::EventDispatcher
end
```

#### EventCommitter

It provides a simple event committer. You can commit events to the event store and dispatch them to the event dispatcher.
It takes also the event composer as a dependency.

It provides the following methods:

- `commit(event:)` - commits an event to the event store and when it is saved then dispatches it to the event dispatcher

```ruby
class ExampleEventCommitter < DDDTooling::Infrastructure::EventCommitter
end
```

#### EventComposer

It provides a simple event composer. You can compose events from your domain objects and dispatch them to the event committer which handles the middleware of
storing and dispatching the events.

It provides the following methods:

- `compose(event:)` - composes an event and dispatches it to the event committer
- `compose_all(events:)` - composes all events and dispatches them to the event committer
- `uncommitted_events` - returns all uncommitted events
- `clear` - clears all uncommitted events

```ruby
class ExampleEventComposer < DDDTooling::Infrastructure::EventComposer
end
```

#### Example of using the event infrastructure

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/philwi/ddd_tooling. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/philwi/ddd_tooling/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DDDTooling project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/philwi/ddd_tooling/blob/main/CODE_OF_CONDUCT.md).
