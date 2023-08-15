class Item
    attr_accessor :id, :publish_date, :archived
  
   # Constructor method
    def initialize(publish_date, archived, id = Random.rand(1..1000)) 
       @id = id
       @publish_date = publish_date
       @archived = archived
    end
  
    #Setter methods
    def genre = (value)
        # instance variables
      @genre = value
    end
  
    def author = (value)
      @author = value
    end
  
    def label = (value)
      @label = value
    end
  
    def source = (value)
      @source = value
    end
  
    def move_to_archived?
    end
  
    def can_be_archived
      end
      
    
    private :id, :can_be_archived, :archived
  
  end