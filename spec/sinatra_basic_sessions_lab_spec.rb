describe App do

  describe 'GET /' do

    it 'sends a 200 status code' do
      get '/'
      expect(last_response.status).to eq(200)
    end

    it 'renders a form to purchase an item' do
      visit '/'
      expect(page).to have_selector("form")
      expect(page).to have_field(:debar)
    end
  end

  describe 'POST /checkout' do

    it "displays the shopping cart contents" do
      visit '/'

      fill_in(:debar, :with => "socks")
      click_button "submit"
      expect(page).to have_text("socks")
    end

    it "sets the params in the session hash" do
      params = {
        :debar => "socks"
      }
      post '/checkout', params
      expect(session.has_key?(:debar)).to eq(true)
      expect(session[:debar]).to eq(params[:debar])
    end
  end

#///////////////////////////////////////////////////
# THese are tests I made just to play around with stuff & functionality
  describe 'Second GET /' do

    it 'sends a 200 status code' do
      get '/newindex'
      expect(last_response.status).to eq(200)
    end

    it 'renders a form to purchase an item' do
      visit '/newindex'
      expect(page).to have_selector("form")
      expect(page).to have_field(:myitem)
    end
  end

  describe 'POST /mynewpost' do

    it "displays some sort of thiny" do
      visit '/newindex'

      fill_in(:myitem, :with => "socks")
      click_button "submit"
      expect(page).to have_text("socks")
    end

    it "does something else too" do
      # let's rename "params" to "arguments" just to see what breaks
      # or what we can seriously fuck up
      arguments = {
        :myitem => "socks"
      }
      post '/mynewpost', arguments
      expect(session.has_key?(:myitem)).to eq(true)
      expect(session[:myitem]).to eq(arguments[:myitem])
    end
  end


end
