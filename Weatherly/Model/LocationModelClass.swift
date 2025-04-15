//
//  LocationModelClass.swift
//  Weatherly
//
//  Created by R Unnikrishnan on 15/04/25.
//

import Foundation
struct LocationModelClass : Codable {
    let name : String?
    let local_names : Local_names?
    let lat : Double?
    let lon : Double?
    let country : String?
    let state : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case local_names = "local_names"
        case lat = "lat"
        case lon = "lon"
        case country = "country"
        case state = "state"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        local_names = try values.decodeIfPresent(Local_names.self, forKey: .local_names)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        state = try values.decodeIfPresent(String.self, forKey: .state)
    }

}
struct Local_names : Codable {
    let hy : String?
    let vi : String?
    let ar : String?
    let el : String?
    let gr : String?
    let eo : String?
    let ce : String?
    let gu : String?
    let zh : String?
    let ug : String?
    let hr : String?
    let be : String?
    let en : String?
    let sr : String?
    let ur : String?
    let he : String?
    let bg : String?
    let te : String?
    let pa : String?
    let fr : String?
    let am : String?
    let ml : String?
    let tl : String?
    let my : String?
    let yi : String?
    let ru : String?
    let uz : String?
    let es : String?
    let ku : String?
    let az : String?
    let os : String?
    let fa : String?
    let de : String?
    let hi : String?
    let th : String?
    let ne : String?
    let mr : String?
    let bn : String?
    let ka : String?
    let ta : String?
    let uk : String?
    let sl : String?
    let lv : String?
    let lt : String?
    let ja : String?
    let oc : String?
    let ko : String?
    let kk : String?
    let kn : String?
    let la : String?
    let kw : String?
    let pt : String?
    let mk : String?

    enum CodingKeys: String, CodingKey {

        case hy = "hy"
        case vi = "vi"
        case ar = "ar"
        case el = "el"
        case gr = "gr"
        case eo = "eo"
        case ce = "ce"
        case gu = "gu"
        case zh = "zh"
        case ug = "ug"
        case hr = "hr"
        case be = "be"
        case en = "en"
        case sr = "sr"
        case ur = "ur"
        case he = "he"
        case bg = "bg"
        case te = "te"
        case pa = "pa"
        case fr = "fr"
        case am = "am"
        case ml = "ml"
        case tl = "tl"
        case my = "my"
        case yi = "yi"
        case ru = "ru"
        case uz = "uz"
        case es = "es"
        case ku = "ku"
        case az = "az"
        case os = "os"
        case fa = "fa"
        case de = "de"
        case hi = "hi"
        case th = "th"
        case ne = "ne"
        case mr = "mr"
        case bn = "bn"
        case ka = "ka"
        case ta = "ta"
        case uk = "uk"
        case sl = "sl"
        case lv = "lv"
        case lt = "lt"
        case ja = "ja"
        case oc = "oc"
        case ko = "ko"
        case kk = "kk"
        case kn = "kn"
        case la = "la"
        case kw = "kw"
        case pt = "pt"
        case mk = "mk"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hy = try values.decodeIfPresent(String.self, forKey: .hy)
        vi = try values.decodeIfPresent(String.self, forKey: .vi)
        ar = try values.decodeIfPresent(String.self, forKey: .ar)
        el = try values.decodeIfPresent(String.self, forKey: .el)
        gr = try values.decodeIfPresent(String.self, forKey: .gr)
        eo = try values.decodeIfPresent(String.self, forKey: .eo)
        ce = try values.decodeIfPresent(String.self, forKey: .ce)
        gu = try values.decodeIfPresent(String.self, forKey: .gu)
        zh = try values.decodeIfPresent(String.self, forKey: .zh)
        ug = try values.decodeIfPresent(String.self, forKey: .ug)
        hr = try values.decodeIfPresent(String.self, forKey: .hr)
        be = try values.decodeIfPresent(String.self, forKey: .be)
        en = try values.decodeIfPresent(String.self, forKey: .en)
        sr = try values.decodeIfPresent(String.self, forKey: .sr)
        ur = try values.decodeIfPresent(String.self, forKey: .ur)
        he = try values.decodeIfPresent(String.self, forKey: .he)
        bg = try values.decodeIfPresent(String.self, forKey: .bg)
        te = try values.decodeIfPresent(String.self, forKey: .te)
        pa = try values.decodeIfPresent(String.self, forKey: .pa)
        fr = try values.decodeIfPresent(String.self, forKey: .fr)
        am = try values.decodeIfPresent(String.self, forKey: .am)
        ml = try values.decodeIfPresent(String.self, forKey: .ml)
        tl = try values.decodeIfPresent(String.self, forKey: .tl)
        my = try values.decodeIfPresent(String.self, forKey: .my)
        yi = try values.decodeIfPresent(String.self, forKey: .yi)
        ru = try values.decodeIfPresent(String.self, forKey: .ru)
        uz = try values.decodeIfPresent(String.self, forKey: .uz)
        es = try values.decodeIfPresent(String.self, forKey: .es)
        ku = try values.decodeIfPresent(String.self, forKey: .ku)
        az = try values.decodeIfPresent(String.self, forKey: .az)
        os = try values.decodeIfPresent(String.self, forKey: .os)
        fa = try values.decodeIfPresent(String.self, forKey: .fa)
        de = try values.decodeIfPresent(String.self, forKey: .de)
        hi = try values.decodeIfPresent(String.self, forKey: .hi)
        th = try values.decodeIfPresent(String.self, forKey: .th)
        ne = try values.decodeIfPresent(String.self, forKey: .ne)
        mr = try values.decodeIfPresent(String.self, forKey: .mr)
        bn = try values.decodeIfPresent(String.self, forKey: .bn)
        ka = try values.decodeIfPresent(String.self, forKey: .ka)
        ta = try values.decodeIfPresent(String.self, forKey: .ta)
        uk = try values.decodeIfPresent(String.self, forKey: .uk)
        sl = try values.decodeIfPresent(String.self, forKey: .sl)
        lv = try values.decodeIfPresent(String.self, forKey: .lv)
        lt = try values.decodeIfPresent(String.self, forKey: .lt)
        ja = try values.decodeIfPresent(String.self, forKey: .ja)
        oc = try values.decodeIfPresent(String.self, forKey: .oc)
        ko = try values.decodeIfPresent(String.self, forKey: .ko)
        kk = try values.decodeIfPresent(String.self, forKey: .kk)
        kn = try values.decodeIfPresent(String.self, forKey: .kn)
        la = try values.decodeIfPresent(String.self, forKey: .la)
        kw = try values.decodeIfPresent(String.self, forKey: .kw)
        pt = try values.decodeIfPresent(String.self, forKey: .pt)
        mk = try values.decodeIfPresent(String.self, forKey: .mk)
    }

}
