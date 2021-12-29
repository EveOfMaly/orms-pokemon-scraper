class Pokemon

    attr_accessor :name, :type, :db, :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save (name, type, db)
        db.execute( "INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        db.execute( "SELECT * FROM pokemon where id = ?", id).map do |row|
           new_pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
           new_pokemon
        end

        # def self.find(id, db)
        #     pokemon_info = db.execute( "SELECT * FROM pokemon where id = ?", id).flatten 
        #     new_pokemon = Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
        
        # #why doesn't iteration work here??
        # end

        
    end


end
