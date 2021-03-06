class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(artist)
    self&.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self&.artist&.name
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != ""
        note = Note.find_or_create_by(content: note)
        self.notes << note
      end
    end
  end
end
