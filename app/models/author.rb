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
