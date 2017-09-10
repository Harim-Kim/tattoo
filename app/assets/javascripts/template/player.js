(function ($) {
  "use strict";
  
  if($('.playlist').length == 0) return;
  
  $.ajax({
    url: 'https://beathub-harim-kim.c9users.io/beats.json',
    success: function(receivedData) {
      
      var musicList = [],
          receivedDataCount = receivedData.length,
          receivedItem = undefined;
      
      for ( var i = 0; i < receivedDataCount; i ++ ) {
        receivedItem = receivedData[i];
        
        musicList.push({
            "id": receivedItem.id,
            "title": receivedItem.title,
            "except": "",
            "link": "track.detail.html",
            "thumb": { "src": receivedItem.cover_url },
            "src": receivedItem.beat_url,
            "meta": {
                "author": "",
                "authorlink": "artist.detail.html",
                "date": "02.05.2016",
                "category": "Jazz",
                "play": 30,
                "like": 10,
                "duration": "4:25"
            }
        });
      }
      
      // [{
      // 	"id": 1,
      // 	"title": "Over the horizon",
      // 	"beat_maker": "ChangD",
      // 	"cover_url": "https://pixabay.com/static/uploads/photo/2016/03/27/16/24/music-1283020__340.jpg",
      // 	"beat_url": "https://s3.ap-northeast-2.amazonaws.com/dispatch11556f/uploads/1470400799YPRGUXBJ.mp3",
      // 	"user_id": 1,
      // 	"detail": "창대의 첫 번째 비트",
      // 	"created_at": "2016-08-23T08:06:44.409Z",
      // 	"updated_at": "2016-08-23T08:06:44.409Z"
      // }, {
      // 	"id": 2,
      // 	"title": "Machinegun",
      // 	"beat_maker": "쿠시",
      // 	"cover_url": "https://tv.pstatic.net/thm?size=120x150\u0026quality=9\u0026q=http://sstatic.naver.net/people/97/201604271955464131.jpg",
      // 	"beat_url": "https://s3.ap-northeast-2.amazonaws.com/dispatch11556f/uploads/justinbieber.mp3",
      // 	"user_id": 2,
      // 	"detail": "창대의 첫 번째 비트",
      // 	"created_at": "2016-08-23T08:06:44.430Z",
      // 	"updated_at": "2016-08-23T08:06:44.430Z"
      // }]
      
      var playlist = $( '.playlist' ).mepPlaylist({
        audioHeight: '40',
        audioWidth: '100%',
        videoHeight: '40',
        videoWidth: '100%',
        audioVolume: 'vertical',
        mepPlaylistLoop: true,
        alwaysShowControls: true,
        mepSkin: 'mejs-audio',
        mepResponsiveProgress: true,
        mepSelectors: {
          playlist: '.playlist',
          track: '.track',
          tracklist: '.tracks'
        },
        features: [
          'meplike',
          'mepartwork',
          'mepcurrentdetails',
          'mepplaylist',
          'mephistory',
          'mepprevioustrack',
          'playpause',
          'mepnexttrack',
          'progress',
          'current',
          'duration',
          'volume',
          'mepicons',
          'meprepeat',
          'mepshuffle',
          'mepsource',
          'mepbuffering',
          'meptracklist',
          'mepplaylisttoggle',
          'youtube'
        ],
        mepPlaylistTracks: musicList
      });
  

      // get player, then you can use the player.mepAdd(), player.mepRemove(), player.mepSelect()
      var player = playlist.find('audio, video')[0].player;
    
      // event on like btn
      player.$node.on('like.mep', function(e, trackid){
        $('[track-id='+trackid+']').toggleClass('is-like');
      });
    
      // event on play
      player.$node.on('play', function(e){
        updateDisplay();
      });
    
      // event on pause
      player.$node.on('pause', function(e){
        updateDisplay();
      });
    
      // update when pjax end
      $(document).on('pjaxEnd', function() {
        updateDisplay();
      });
    
      // simulate the play btn
      $(document).on('click.btn', '.btn-playpause', function(e){
          e.stopPropagation();
          var self = $(this);
          if( self.hasClass('is-playing') ){
            self.removeClass('is-playing');
            player.pause();
          }else{
            var item = getItem(self);
            item && player.mepAdd(item, true);
          }
      });
      

      
      function updateDisplay(){
        $('[data-id]').removeClass('active').find('.btn-playpause').removeClass('is-playing').parent().removeClass('active');
        var track = player.mepGetCurrentTrack();
        if(!track || !track.id) return;
        var item = $('[data-id="'+track.id+'"]');
        if( player.media.paused ){
          item.removeClass('active').find('.btn-playpause').removeClass('is-playing').parent().removeClass('active');
        }else{
          item.addClass('active').find('.btn-playpause').addClass('is-playing').parent().addClass('active');
        }
      }
    
      // get item data, you can use ajax to get data from server
      function getItem(self){
        var item = self.closest('.item');
        // track detail
        if(!item.attr('data-src')){
          self.toggleClass('is-playing');
          $('#tracks').find('.btn-playpause').first().trigger('click');
          return false;
        }
    
        var obj = {
            meta: {
               author: item.find('.item-author').find('a').text()
              ,authorlink : item.find('.item-author').find('a').attr('href')
            }
            ,src: self.closest('[data-src]').attr("data-src")
            ,thumb: {
              src: item.find('.item-media-content').css("background-image").replace(/^url\(["']?/, '').replace(/["']?\)$/, '')
            }
            ,title: item.find('.item-title').find('a').text()
            ,link: item.find('.item-title').find('a').attr('href')
            ,id: self.attr("data-id") ? self.attr("data-id") : self.closest('[data-id]').attr("data-id")
        };
        return obj;
      }
      
    }
  });

})(jQuery);
