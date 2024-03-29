class Year11ClassC {
  String autoBio;
  String bestMoment;
  String dob;
  String dreamCollege;
  String email;
  String facebook;
  String hobbies;
  String id;
  String image;
  String instagram;
  String myDropline;
  String name;
  String nickname;
  String philosophy;
  String phone;
  String prefect;
  String positionEnforced;
  String snapchat;
  String tikTok;
  String constituentCountry;
  String regionFrom;
  String favSubject;
  String favSchoolActivity;
  String favClassmate;
  String favPlaceInCampus;
  String favSportInCampus;
  String favWatchedMovie;
  String twitter;
  String worstMoment;

  Year11ClassC.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    autoBio = data['autobio'];
    bestMoment = data['best_moment'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    prefect = data['prefect'];
    positionEnforced = data['position_enforced'];
    constituentCountry = data['constituent_country'];
    regionFrom = data['region_from'];
    twitter = data['twitter'];
    dob = data['d_o_b'];
    dreamCollege = data['dream_college'];
    snapchat = data['snapchat'];
    tikTok = data['tiktok'];
    favSubject = data['fav_subject'];
    favSchoolActivity = data['fav_school_activity'];
    favClassmate = data['fav_classmate'];
    favPlaceInCampus = data['fav_place_in_campus'];
    favSportInCampus = data['fav_sport_in_campus'];
    favWatchedMovie = data['fav_watched_movie'];
    hobbies = data['hobbies'];
    myDropline = data['my_dropline'];
    philosophy = data['philosophy'];
    worstMoment = data['worst_moment'];
  }

}