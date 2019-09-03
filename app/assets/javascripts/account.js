window.onload = function() {

  let removeFriendBtns = document.getElementsByClassName('delete-friend-btn');
  let addFriendBtns = document.getElementsByClassName('add-friend-btn');
  let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  class Account {

    constructor() {
      
    }

    static addFriend(userId) {
      return fetch('/relationships', {
        method: 'POST',
        headers: {
          'Content-type': 'application/json; charset=utf-8',
          'X-CSRF-Token': token
        },
        body: JSON.stringify({
          user_id: userId
        })
      })
    }

    static removeFriend(userId) {
      return fetch(`/relationships/${userId}`, {
        method: 'DELETE',
        headers: {
          'Content-type': 'application/json; charset=utf-8',
          'X-CSRF-Token': token
        }
      })
    }

  }

  for (let j = 0; j <= removeFriendBtns.length - 1; j++) {
    removeFriendBtns[j].onclick = function(event) {
      let btn = event.target;
      let userId = btn.getAttribute('data-user-id');
  
      Account.removeFriend(userId)
        .then(response => response.json())
        .then(data => {
          console.log(data);
          location.reload();
        })
    }
  }

  for (let i = 0; i <= addFriendBtns.length - 1; i++) {
    addFriendBtns[i].onclick = function(event) {
      let btn = event.target;
      let userId = btn.getAttribute('data-user-id');
  
      Account.addFriend(userId)
        .then(response => response.json())
        .then(data => {
          console.log(data);
          location.reload();
        })
    }
  }

}

