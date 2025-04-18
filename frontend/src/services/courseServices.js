import { axiosInstance } from "../api/post";

const getCourse = () => axiosInstance.get("/course/getcourse");
const getCourseById = (id) => axiosInstance.get(`/course/getcourse/${id}`);
const getFavoriteCourse = () =>
  axiosInstance.get("/course/getcourse").then((response) => {
    return response.data.filter((course) => course.favorit === true);
  });
const getCourseByCategory = (categoryId) =>
  axiosInstance.get("/course/getcourse").then((response) => {
    return response.data.filter(
      (course) => course.fk_id_category === categoryId
    );
  });
const getRecommendedCourses = (categoryId, courseId) =>
  axiosInstance.get("/course/getcourse").then((response) => {
    return response.data.filter(
      (course) =>
        course.fk_id_category === categoryId && course.id_course !== courseId
    );
  });
const getCartUser = (userId) =>
  axiosInstance.get(`/course/getCartUser?id_user=${userId}`);
const getCourseUser = (userId) =>
  axiosInstance.get(`/course/getcourseuser?id_user=${userId}`);
const insertCourseUser = (data) =>
  axiosInstance.post("/course/InsertCourseUser", data);
const deleteCourseUser = (id) =>
  axiosInstance.delete(`/course/deleteCourseUser?id_course_user=${id}`);
const changeCheckedCourseUser = (id, status) =>
  axiosInstance.put(`/course/ChangeCheckedCourseUser?id_course_user=${id}`, {
    check: status,
  });

const courseServices = {
  getCourse,
  getCourseById,
  getFavoriteCourse,
  getCourseByCategory,
  getRecommendedCourses,
  getCartUser,
  getCourseUser,
  insertCourseUser,
  deleteCourseUser,
  changeCheckedCourseUser,
};

export default courseServices;
