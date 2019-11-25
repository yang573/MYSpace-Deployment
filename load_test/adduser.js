import http from "k6/http";
import { check, sleep } from "k6";

export let options = {
    /*
    vus: 10,
    duration: "30s"
    */
    stages: [
        { duration: "10s", target: 20 },
        //{ duration: "1m", target: 20  },
        //{ duration: "20s", target: 0 },
    ]
};

export default function() {
    let url = "http://10.142.0.10/adduser";
    let uuid = uuidv4();
    let payload = JSON.stringify({ username: uuid, email: uuid + "@lasersharks.com", password: "apple"});
    let params = { headers: { "Content-Type": "application/json" } }
    let res = http.post(url, payload, params);
    check(res, {
        "status was 200": (r) => r.status == 200,
        "transaction time OK": (r) => r.timings.duration < 2500
    });
    //sleep(1);
}

function uuidv4() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        let r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

