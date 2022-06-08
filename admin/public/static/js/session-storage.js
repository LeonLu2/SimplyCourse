SESSION_KEY_COURSE = "SESSION_KEY_COURSE"; // when click chapter in course, save course info
SESSION_KEY_CHAPTER = "SESSION_KEY_CHAPTER"; // when click section in chapter, save chapter info
SESSION_KEY_LOGIN_USER = "SESSION_KEY_LOGIN_USER"; // Login user info

SessionStorage = {
    get: function (key) {
        let v = sessionStorage.getItem(key);
        if (v && typeof(v) !== "undefined" && v !== "undefined") {
            return JSON.parse(v);
        }
    },
    set: function (key, data) {
        sessionStorage.setItem(key, JSON.stringify(data));
    },
    remove: function (key) {
        sessionStorage.removeItem(key);
    },
    clearAll: function () {
        sessionStorage.clear();
    }
};