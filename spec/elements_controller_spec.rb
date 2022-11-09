# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

#  require '/home/ksusha/uni/labs_web/laba8/app/controllers/elements_controller'

# testing ElementsController
RSpec.describe ElementsController, type: :controller do
  it 'returns true if value is a power of 5' do
    expect(ElementsController.power_of_5?(0)).to eq(false)
    expect(ElementsController.power_of_5?(1)).to eq(true)
    expect(ElementsController.power_of_5?(5)).to eq(true)
  end

  it 'returns zero length array when there are no segments of powers of 5' do
    arr = [0, 6, 7, 24, 26, 90]
    expect(ElementsController.segments_of_powers(arr)).to eq([])
  end

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end

RSpec.describe ElementsController, type: 'request' do
  it 'expects to see sequences of powers of 5' do
    get '/elements/result?length=7&str_elem=1+2+3+4+5+6+7'
    expect(assigns[:length_of_arr]).to eq(7)
  end

  it 'alert message' do
    get '/elements/result?length=7&str_elem=1+2+3+4+5+6+q'
    expect(flash[:alert]).to eq("Sequence isn't correct")

    get '/elements/result?length=4&str_elem=1+2+3+4+5+6'
    expect(flash[:alert]).to eq("Length isn't correct")
  end
end
