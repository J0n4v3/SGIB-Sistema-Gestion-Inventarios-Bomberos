require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:equipos_proteccion)
    @user = users(:admin)
    sign_in @user
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference("Category.count") do
      post categories_url, params: {
        category: { nombre: "Materiales de Rescate", descripcion: "Cuerdas y arneses" }
      }
    end
    assert_redirected_to categories_url
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: {
      category: { nombre: "EPP Actualizado", descripcion: @category.descripcion }
    }
    assert_redirected_to categories_url
  end

  test "should destroy category" do
    cat = Category.create!(nombre: "Temporal", descripcion: "Para borrar")
    assert_difference("Category.count", -1) do
      delete category_url(cat)
    end
    assert_redirected_to categories_url
  end
end
