
class ScenarioContext

  @context

  def getScenarioContext
    if @context==nil
      @context=Hash.new
    end
    return @context
  end

  def getContext(key)

    @@hash=getScenarioContext
    return @@hash[key]

  end

  def setContext(key,value)

    @@hash=getScenarioContext
    @@hash[key]=value

  end

end

