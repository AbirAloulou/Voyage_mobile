import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Acceuil",
      "icon": Icon(
        Icons.home_filled,
        color: Colors.indigo,
      ),
      "route": "/home"
    },
    {
      "title": "Météo",
      "icon": Icon(
        Icons.sunny_snowing,
        color: Colors.indigo,
      ),
      "route": "/meteo"
    },
    {
      "title": "Gallerie",
      "icon": Icon(
        Icons.image_rounded,
        color: Colors.indigo,
      ),
      "route": "/gallerie"
    },
    {
      "title": "Pays",
      "icon": Icon(
        Icons.maps_home_work_rounded,
        color: Colors.indigo,
      ),
      "route": "/pays"
    },
    {
      "title": "Contact",
      "icon": Icon(
        Icons.contact_page_rounded,
        color: Colors.indigo,
      ),
      "route": "/contact"
    },
    {
      "title": "Prière",
      "icon": Icon(
        Icons.mosque_rounded,
        color: Colors.indigo,
      ),
      "route": "/priere"
    },
    {
      "title": "Paramètres",
      "icon": Icon(
        Icons.settings,
        color: Colors.indigo,
      ),
      "route": "/parametres"
    },
    {
      "title": "Déconnexion",
      "icon": Icon(
        Icons.logout_outlined,
        color: Colors.indigo,
      ),
      "route": "/login"
    },
  ];

  static List<Map<String, dynamic>> accueil = [
    {"title": "images/meteo.png", "route": "/meteo"},
    {"title": "images/gallerie.png", "route": "/gallerie"},
    {"title": "images/pays.png", "route": "/pays"},
    {"title": "images/contact.png", "route": "/contact"},
    {"title": "images/parametres.png", "route": "/parametres"},
    {"title": "images/deconnexion.png", "route": "/login"},
  ];

  static List<Map<String, dynamic>> priere = [
    {
      "fr": "Fajr",
      "ar": "الفجر",
    },
    {
      "fr": "Dhuhr",
      "ar": "الظهر",
    },
    {
      "fr": "Asr",
      "ar": "العصر",
    },
    {
      "fr": "Maghrib",
      "ar": "المغرب",
    },
    {
      "fr": "Isha",
      "ar": "العشاء",
    },
  ];

  static List<Map<String, dynamic>> priere_timing = [
    {
      "ang": "Sunrise",
      "fr": "Levé",
      "ar": "الشروق",
      "image": "images/sunrise.jpg",
    },
    {
      "ang": "Sunset",
      "fr": "Coucher",
      "ar": "الغروب",
      "image": "images/sunset.jpg",
    },
    // {
    //   "ang": "hijri",
    //   "fr": "Date en Hijri",
    //   "ar": "التاريخ الهجري",
    //   "image": "images/calendar.jpg",
    // },
  ];
}
