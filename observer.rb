class Observable
  
  attr_reader :name

  def initialize(name)
    @observers = []
    @name = name
  end

  #adds a watcher as an observer  - added to an observable object's observers
  def add_observer(observer)
    @observers << observer
    puts "#{observer.name} is now watching #{self.name}"
  end 

  #alert the observes of a change on observable
  def update(string)
    @observers.each {|x| x.announce_update(string) }
    nil
  end
end

class Watcher
  
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  #observe an observable object
  def observe(observable)
    observable.add_observer(self)
  end

  #alerts watcher of an update to an observable
  def announce_update(string)
    puts "#{name} observed #{string} at #{Time.now}"
  end
end

linda = Watcher.new('linda')
franco = Watcher.new('franco')
clock = Observable.new("clock")
linda.observe(clock)
franco.observe(clock)
clock.update("ding dong")