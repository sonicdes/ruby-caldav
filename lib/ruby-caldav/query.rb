module CalDAV
  class Query
    attr_accessor :child
    
    #TODO: raise error if to_xml is called before child is assigned
    def to_xml(xml = Builder::XmlMarkup.new(:indent => 2))
      xml.instruct!
      xml.tag! "cal:calendar-query", CalDAV::NAMESPACES do
        xml.tag! "dav:prop" do
          xml.tag! "dav:getetag"
          xml.tag! "cal:calendar-data"
        end
        xml.tag! "cal:filter" do
          cal = Filter::Component.new("VCALENDAR", self)
          cal.child = self.child
          cal.build_xml(xml)
        end
      end
    end
    
    def event(param = nil)
      self.child = Filter::Component.new("VEVENT")
      if param.is_a? Range
        self.child.time_range(param) 
      elsif param.is_a? String
        self.child.uid(param)
      else
        self.child
      end
    end

    def todo(param = nil)
      self.child = Filter::Component.new("VTODO")
      self.child
    end
    
    def child=(child)
      child.parent = self
      @child = child
    end

    def self.event( param=nil )
        self.new.event( param )
    end


    def self.todo( param=nil )
        self.new.todo
    end
  end
end
