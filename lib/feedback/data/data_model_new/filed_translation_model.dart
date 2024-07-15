class FieldTranslation {
    FieldTranslation({
        required this.placeHolder,
        required this.fieldLabel,
        required this.subTitle,
        required this.helpTextFirstOption,
        required this.helpTextLastOption,
        required this.invalidFieldMessage,
    });

    final String? placeHolder;
    final String? fieldLabel;
    final String? subTitle;
    final String? helpTextFirstOption;
    final String? helpTextLastOption;
    final String? invalidFieldMessage;

    factory FieldTranslation.fromJson(Map<String, dynamic> ?json){ 
        if (json == null) {
        throw ArgumentError("JSON data cannot be null");
    }
        return FieldTranslation(
            placeHolder: json["placeHolder"],
            fieldLabel: json["fieldLabel"],
            subTitle: json["subTitle"],
            helpTextFirstOption: json["helpTextFirstOption"],
            helpTextLastOption: json["helpTextLastOption"],
            invalidFieldMessage: json["invalidFieldMessage"],
        );
    }

}