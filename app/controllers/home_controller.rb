class HomeController < ApplicationController
    def index
      # @urls = Url.where(:imageurl => 'DNE')
      @urls = Url.all
    end
    
    def saveurl
      # data is sent here in a variable called params
      thing=params['address'];
      if(thing[0..6]=="http://")
        thing["http://"]="";
      end
      if(thing[0..3]=="www.")
        thing["www."]="";
      end
      if(thing[0..11]=="youtube.com/")
        thing["youtube.com/"]="";
        thing["watch?v="]="";
        final=params['name'];
        a = Url.new(:address => thing[0..10], :imageurl => final)
        a.save
        render :json => a
      end
    end
end
