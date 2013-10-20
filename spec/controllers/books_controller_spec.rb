require 'spec_helper'

describe BooksController do

  describe "GET index" do

    it "should assign @books" do
      book = Book.create(title: "my book", author: "some author", cuisine: "some cuisine", publication_date: "Oct 2013")
      get  :index
      # expect Book.all in 'def index' to return the "book" we just created from the db
      expect(assigns(:books)).to eq([book])
    end

    it "should render index.html.erb" do
      get :index
      expect(response).to render_template :index
    end
  end # describe Get index

  describe "POST create" do

    context "valid params are sent" do
      it "should add book to database" do
        expect { post :create,
          book: {title: "new book", author: "Jackie", cuisine: "regular", publication_date: "Jan 2012"}
        }.to change(Book, :count).by(1)
      end
    end

    context "invalid params are sent" do
      it "should not add to database" do
        expect { post :create,
          book: {author: "Jackie"}
        }.to_not change(Book, :count)
      end

      it "should render new form" do
        post :create,
          book: {author: "Jackie"}
        expect(response).to render_template :new
      end
    end

  end # describe Post create

  describe "GET new" do

    it "should render new.html.erb" do
      get :new
      expect(response).to render_template :new
    end
  end # describe GET new

  describe "GET edit" do

    # it "should render edit.html.erb" do
    #   get :edit
    #   expect(response).to render_template :edit
    # end
  end # describe GET edit

  describe "GET update" do

    #  context "valid params are sent" do
    #   it "should add book to database" do
    #     expect { post :update,
    #       book: {title: "new book", author: "Jackie", cuisine: "regular", publication_date: "Jan 2012"}
    #     }.to change(Book, :count).by(0)
    #   end
    # end
  end # describe Get update

end
