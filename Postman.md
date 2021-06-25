1. Получить все информацию о своих подписках: https://vk.com/dev/users.getSubscriptions 

"GET" https://api.vk.com/method/users.getSubscriptions?&access_token=482747380474ac386e664521a8a3a5230ad544950bd20fe4407125be8c2dbaeea2288b165ec0eb616bd47&v=5.131

{
    "response": {
        "users": {
            "count": 0,
            "items": []
        },
        "groups": {
            "count": 1,
            "items": [
                45909225
            ]
        }
    }
}

2. Найти пользователей, сответствуюших заданному параметру поиска: https://vk.com/dev/users.search 

"GET" https://api.vk.com/method/users.search?q=АнтонЩетинин&access_token=482747380474ac386e664521a8a3a5230ad544950bd20fe4407125be8c2dbaeea2288b165ec0eb616bd47&v=5.131&count=3

{
    "response": {
        "count": 162,
        "items": [
            {
                "first_name": "Антон",
                "id": 485658405,
                "last_name": "Щетинин",
                "can_access_closed": true,
                "is_closed": false,
                "track_code": "4ab8ed2czZaM-r4hy4nA8YSVcOmdSGUTM-HxUbc5nRjVZQca3Lyq_836507L1Zb_sTvMEWVPDR014vFRuV8"
            },
            {
                "first_name": "Антон",
                "id": 452008330,
                "last_name": "Щетинин",
                "can_access_closed": true,
                "is_closed": false,
                "track_code": "390b82faSkznyZ77xSpxlL3z6nYT85n798wHea4wxYqJGRUy94wtJa2bw5aULHCcjF1Rje708fXxzwd5oFY"
            }
        ]
    }
}

3. Получить информацию о друзьях любого пользователя (сортировка по имени, получить nickname): https://vk.com/dev/friends.get 

"GET" https://api.vk.com/method/friends.get?access_token=482747380474ac386e664521a8a3a5230ad544950bd20fe4407125be8c2dbaeea2288b165ec0eb616bd47&v=5.131

{
    "response": {
        "count": 18,
        "items": [
            17080465,
            20808941,
            26889435,
            32022474,
            40504233,
            76071532,
            93272954,
            96756546,
            145829347,
            145939985,
            148404523,
            198970149,
            203773755,
            269007584,
            365533027,
            420272776,
            443308438,
            470228320
        ]
    }
}

4. О друзьях, которые онлайн : https://vk.com/dev/friends.getOnline

"GET" https://api.vk.com/method/friends.getOnline?access_token=482747380474ac386e664521a8a3a5230ad544950bd20fe4407125be8c2dbaeea2288b165ec0eb616bd47&v=5.131

{
    "response": [
        32022474,
        443308438
    ]
}

5. Возвращает список идентификаторов недавно добавленных друзей текущего пользователя: https://vk.com/dev/friends.getRecent

"GET" https://api.vk.com/method/friends.getRecent?access_token=482747380474ac386e664521a8a3a5230ad544950bd20fe4407125be8c2dbaeea2288b165ec0eb616bd47&v=5.131

{
    "response": [
        443308438,
        269007584,
        96756546,
        148404523,
        145829347,
        20808941,
        32022474,
        145939985,
        203773755,
        26889435,
        365533027,
        470228320,
        420272776,
        17080465,
        198970149,
        76071532,
        40504233,
        93272954
    ]
}

6. Возвращает список профилей пользователей, которые могут быть друзьями текущего пользователя. https://vk.com/dev/friends.getSuggestions 

"GET" https://api.vk.com/method/friends.getSuggestions?access_token=482747380474ac386e664521a8a3a5230ad544950bd20fe4407125be8c2dbaeea2288b165ec0eb616bd47&v=5.131&count=3


{
    "response": {
        "count": 390,
        "items": [
            {
                "first_name": "Даниил",
                "id": 158411007,
                "last_name": "Тарасевич",
                "can_access_closed": true,
                "is_closed": false
            },
            {
                "first_name": "Yegor",
                "id": 544587172,
                "last_name": "Zuikov",
                "can_access_closed": true,
                "is_closed": false
            },
            {
                "first_name": "Nikita",
                "id": 562176572,
                "last_name": "Pinchuk",
                "can_access_closed": false,
                "is_closed": true
            }
        ]
    }
}

7. Возвращает список полученных подарков пользователя.

"GET" https://api.vk.com/method/gifts.get?access_token=482747380474ac386e664521a8a3a5230ad544950bd20fe4407125be8c2dbaeea2288b165ec0eb616bd47&v=5.131&count=1

{
    "response": {
        "count": 18,
        "items": [
            {
                "id": -1401878514,
                "from_id": 470228320,
                "message": "",
                "date": 1620561108,
                "gift": {
                    "id": 711,
                    "thumb_256": "https://vk.com/images/gift/711/256.jpg",
                    "thumb_48": "https://vk.com/images/gift/711/48.png",
                    "thumb_96": "https://vk.com/images/gift/711/96.png"
                },
                "privacy": 0
            }
        ]
    }
