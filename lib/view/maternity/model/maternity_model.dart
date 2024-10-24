// To parse this JSON data, do
//
//     final maternityModel = maternityModelFromJson(jsonString);

class MaternityModel {
    final int id;
    final String name;
    final int age;
    final String bmi;
    // final String pregnancyRisk;
    final DateTime expectedDateOfDelivery;
    final DateTime lastMenstrualDate;
    final List<HighRiskModel> highRisks;

    MaternityModel({
        required this.id,
        required this.name,
        required this.age,
        required this.bmi,
        // required this.pregnancyRisk,
        required this.expectedDateOfDelivery,
        required this.lastMenstrualDate,
        required this.highRisks,
    });

    factory MaternityModel.fromJson(Map<String, dynamic> json) {
        return MaternityModel(
            id: json['id'],
            name: json['name'],
            age: json['age'],
            bmi: json['bmi'],
            // pregnancyRisk: json['pregnancyRisk'],
            expectedDateOfDelivery: DateTime.parse(json['expectedDateOfDelivery']),
            lastMenstrualDate: DateTime.parse(json['lastMenstrualDate']),
            highRisks: (json['highRisks'] as List)
                .map((highRisk) => HighRiskModel.fromJson(highRisk))
                .toList(),
        );
    }
}

class HighRiskModel {
    final int id;
    final bool severeAnemia;
    final bool highBloodPressure;
    final bool gestationalDiabetes;
    final bool teenagePregnancy;
    final bool priorCaesareanOperation;

    HighRiskModel({
        required this.id,
        required this.severeAnemia,
        required this.highBloodPressure,
        required this.gestationalDiabetes,
        required this.teenagePregnancy,
        required this.priorCaesareanOperation,
    });

    factory HighRiskModel.fromJson(Map<String, dynamic> json) {
        return HighRiskModel(
            id: json['id'],
            severeAnemia: json['severeAnemia'],
            highBloodPressure: json['highBloodPressure'],
            gestationalDiabetes: json['gestationalDiabetes'],
            teenagePregnancy: json['teenagePregnancy'],
            priorCaesareanOperation: json['priorCaesareanOperation'],
        );
    }
}


