import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Descriptions(String stat){
  late String desc;
  if(stat == "Overweight")
    {
      desc = "You're a little bit overpassing your body mass index, you could choose healthier foods (whole grains, fruits and vegetables, healthy fats and protein sources) and beverages. Limiting unhealthy foods (refined grains and sweets, potatoes, red meat, processed meat) and beverages (sugary drinks) Increasing physical activity. Limiting television time, screen time, and other “sit time”";
    }
  else if(stat == "Normal")
    {
      desc = "Your body is in a good shape! Remember to keep having regular exercises and healthy diets to maintain your body condition, do not forget to have a healthy sleep cycle";
    }
  else if(stat == "Underweight"){
      desc = "If you are underweight, it is important to eat a variety of foods that give you the nutrition you need. You should make sure you eat enough energy to gain weight, protein to repair your body and build your muscles, and vitamins and minerals to make you healthy.";
  }
  else if(stat == "Obessed"){
      desc = "Healthy diet and physical activity always go hand-in-hand in decreasing the risk of obesity and even in combating it if you already are obese or overweight \n\n Exercise, even in moderate amounts, can go a long way in helping you keep the weight off. Aerobic activities like walking, hiking and dancing or more vigorous ones like running, swimming and cycling will increase your energy expenditure therefore helping you burn fat and increase your muscle weight.";
  }

  return desc;
}