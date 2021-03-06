//
//  TrackApiTest.swift
//  iTunesSearchTests
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Quick
import Nimble
import Swinject
@testable import iTunesSearch

class TrackApiTest: QuickSpec {
    
    struct MockTrackAPi: Api {
            
        
       func retrieve(urlString: String, handler: @escaping ((Page) -> Void)) {
        let file = """
             {
                "resultCount":1,
                "results": [ { "wrapperType":"track","kind":"tv-episode", "artistId":269570329, "collectionId":309366086, "trackId":309564409, "artistName":"Californication", "collectionName":"Californication, Season 2", "trackName":"In Utero", "collectionCensoredName":"Californication, Season 2", "trackCensoredName":"In Utero", "artistViewUrl":"https://itunes.apple.com/us/tv-show/californication/id269570329?uo=4", "collectionViewUrl":"https://itunes.apple.com/us/tv-season/in-utero/id309366086?i=309564409&uo=4", "trackViewUrl":"https://itunes.apple.com/us/tv-season/in-utero/id309366086?i=309564409&uo=4",
                "previewUrl":"https://video-ssl.itunes.apple.com/itunes-assets/Video127/v4/55/9c/c8/559cc8bf-4071-4c9a-0181-785b60cba46a/mzvf_5202598431151026236.640x480.h264lc.U.p.m4v", "artworkUrl30":"https://is1-ssl.mzstatic.com/image/thumb/Music3/v4/69/13/45/69134598-4435-7023-e96e-875fc9374744/source/30x30bb.jpg", "artworkUrl60":"https://is1-ssl.mzstatic.com/image/thumb/Music3/v4/69/13/45/69134598-4435-7023-e96e-875fc9374744/source/60x60bb.jpg", "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Music3/v4/69/13/45/69134598-4435-7023-e96e-875fc9374744/source/100x100bb.jpg", "collectionPrice":19.99, "trackPrice":1.99, "collectionHdPrice":24.99000, "trackHdPrice":2.99000, "releaseDate":"2008-11-30T08:00:00Z", "collectionExplicitness":"notExplicit", "trackExplicitness":"notExplicit", "discCount":1, "discNumber":1, "trackCount":12, "trackNumber":10, "trackTimeMillis":1704703, "country":"USA", "currency":"USD", "primaryGenreName":"Comedy", "contentAdvisoryRating":"TV-MA",
                "shortDescription":"Hank nervously awaits medical test results while reflecting on the early days of his romance with Karen, which coincided with a famous grunge rocker's overdose.",
                "longDescription":"While Hank nervously awaits the results of his biopsy, he reflects on his relationship with Karen, and we flashback to the beginning of their stormy union - an event that coincides with the tragic overdose of a famous grunge rocker. Meanwhile, Daisy tells Charlie that she's moving out, but Charlie doesn't want to let her go."}]
                }
            """
            do {
               let data = try JSONDecoder().decode(Page.self, from: file.data(using: .utf8)!)
               handler(data)
           } catch {
            
           }
         
        
           
       }
    }
    
     override func spec() {
        
        var container: Container!
        beforeEach {
            container = Container()
            container.register(from:.trackModel, value: TrackModel(api: MockTrackAPi()))
           
        }
        
        it("fetch correctly data when searchText change"){
            let model : TrackModel = container.resolve(from: .trackModel)
            model.searchText = "Billie Eilish"
            let firstItem = model.tracks.first
            expect(firstItem?.artistName).to(equal("Californication"))
        }
        
        it("fetch correctly data when searchText change"){
            let model : TrackModel = container.resolve(from: .trackModel)
            model.setPage(page: 1)
            
            let firstItem = model.tracks.first
            expect(firstItem?.artistName).to(equal("Californication"))
        }
        
        it("get correct page when is setted"){
            let model : TrackModel = container.resolve(from: .trackModel)
            model.setPage(page: 10)
            expect(model.getPage()).to(equal(10))
        }
        
        describe("reset values when search text is empty"){
            it("set tracks empty when search text is empty"){
               let model : TrackModel = container.resolve(from: .trackModel)
               model.searchText = "Billie Eilish"
               expect(model.tracks.count).to(equal(1))
                
               model.searchText = ""
               expect(model.tracks.count).to(equal(0))
           }
            
            it("set page in 0 when search text is empty"){
                let model : TrackModel = container.resolve(from: .trackModel)
                model.setPage(page: 10)
                expect(model.getPage()).to(equal(10))
                model.searchText = ""
                expect(model.getPage()).to(equal(0))
            }
        }
    }
}
