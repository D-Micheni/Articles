class Author

  attr_reader :first_name, :last_name

  @@all = []
  def initialize(name)
    name = name.split()
    @first_name = name[0]
    @last_name = name[1]
    @@all << self
  end

  def self.all
    @@all
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def new_article(title, magazine)
    Article.new(self, magazine, title)
  end

  def articles
    Article.all.select { |article| article.author == self}
  end

  def topic_areas
    articles.map { |article| article.magazine.category}.uniq
  end

  def magazines
    articles.map(&:magazine)
  end
end

class Magazine
  attr_reader :name, :category
  @@all = []
    def initialize(name, category)
      @name = name
      @category = category
      @@all << self
  end

  def self.all
    @@all
  end

  def new_article(title, author)
    Article.new(author, self, title)
  end

  def articles
    Article.all.select { |article| article.magazine == self}
  end

  def authors
    articles.map {|art| art.author}.uniq
  end

  def self.find_by_name(name)
    magazine = self.all.find { |magazine| magazine.name == name}
    magazine.name
  end

end

class Article
  attr_reader :author, :magazine, :title
  @@all = []
  def initialize (author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
  end

  def self.all
      @@all
  end

end

