document.addEventListener('DOMContentLoaded', function() {
    const postsContainer = document.getElementById('posts-container');
    const showMoreButton = document.getElementById('show-more-btn');
    const allPosts = "<%= j render 'posts', posts: @user.posts %>"
  
    showMoreButton.addEventListener('click', function() {
      postsContainer.innerHTML = allPosts;
      showMoreButton.style.display = 'none';
    });
  });
  