class PopularFilterListData {
    PopularFilterListData({
        this.titleTxt = '',
        this.isSelected = false,
    });

    String titleTxt;
    bool isSelected;

    static List<PopularFilterListData> popularFList = <PopularFilterListData>[
        PopularFilterListData(
            titleTxt: 'Zatonj Wi-Fi',
            isSelected: false,
        ),
        PopularFilterListData(
            titleTxt: 'Živali',
            isSelected: false,
        ),
        PopularFilterListData(
            titleTxt: 'Bazen',
            isSelected: true,
        ),
        PopularFilterListData(
            titleTxt: 'Šport',
            isSelected: false,
        ),
        PopularFilterListData(
            titleTxt: 'Restavracije',
            isSelected: false,
        ),
    ];

    static List<PopularFilterListData> accomodationList = [
        PopularFilterListData(
            titleTxt: 'Vse',
            isSelected: false,
        ),
        PopularFilterListData(
            titleTxt: 'Bungalovi',
            isSelected: false,
        ),
        PopularFilterListData(
            titleTxt: 'Mobilne hiške',
            isSelected: true,
        ),
        PopularFilterListData(
            titleTxt: 'Avtodomi',
            isSelected: false,
        ),
        PopularFilterListData(
            titleTxt: 'Prikolice',
            isSelected: false,
        ),
        PopularFilterListData(
            titleTxt: 'Šotori',
            isSelected: false,
        ),
    ];
}
