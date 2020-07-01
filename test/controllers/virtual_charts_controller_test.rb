require 'test_helper'

class VirtualChartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @virtual_chart = virtual_charts(:one)
  end

  test "should get index" do
    get virtual_charts_url, as: :json
    assert_response :success
  end

  test "should create virtual_chart" do
    assert_difference('VirtualChart.count') do
      post virtual_charts_url, params: { virtual_chart: { date: @virtual_chart.date, note: @virtual_chart.note, patient_id: @virtual_chart.patient_id, provider_id: @virtual_chart.provider_id } }, as: :json
    end

    assert_response 201
  end

  test "should show virtual_chart" do
    get virtual_chart_url(@virtual_chart), as: :json
    assert_response :success
  end

  test "should update virtual_chart" do
    patch virtual_chart_url(@virtual_chart), params: { virtual_chart: { date: @virtual_chart.date, note: @virtual_chart.note, patient_id: @virtual_chart.patient_id, provider_id: @virtual_chart.provider_id } }, as: :json
    assert_response 200
  end

  test "should destroy virtual_chart" do
    assert_difference('VirtualChart.count', -1) do
      delete virtual_chart_url(@virtual_chart), as: :json
    end

    assert_response 204
  end
end
