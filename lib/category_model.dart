class CategoryModel {
  late String categoryName;
  late String image;
}

List<CategoryModel> getCategories(){

  List<CategoryModel> myCategories = <CategoryModel>[];
  CategoryModel categoryModel;

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.image = "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sport";
  categoryModel.image = "https://media.istockphoto.com/photos/basketball-player-slam-dunking-ball-picture-id1254565557";
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Event";
  categoryModel.image = "https://crmviet.vn/wp-content/uploads/2019/05/event-marketing.jpg";
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "http://dreamworld.edu.vn/uploads/Du%20h%E1%BB%8Dc%20ng%C3%A0nh%20Technology%20t%E1%BA%A1i%20M%E1%BB%B9.jpg";
  myCategories.add(categoryModel);

  return myCategories;
}