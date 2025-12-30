document.addEventListener('DOMContentLoaded', () => {
  if (!movies || movies.length === 0) {
    console.error('영화 리스트가 없습니다.');
    return;
  }

  let currentRound = [];
  let nextRound = [];
  let index = 0;
  let roundSize = 16;

  const leftEl = document.getElementById('leftMovie');
  const rightEl = document.getElementById('rightMovie');
  const progressEl = document.getElementById('progressText');
  const startBtn = document.getElementById('startBtn');
  const roundSelect = document.getElementById('roundSelect');

  startBtn.addEventListener('click', () => {
    roundSize = parseInt(roundSelect.value) || 16;
    startTournament();
  });

  function startTournament() {
    currentRound = shuffle(movies).slice(0, roundSize);
    nextRound = [];
    index = 0;

    document.querySelector('.round-select').classList.add('hidden');
    document.querySelector('.match').classList.remove('hidden');

    showMatch();
  }

  function showMatch() {
    if (index >= currentRound.length) {
      if (currentRound.length === 1) {
        window.location.href = `${root}/detail?id=${currentRound[0].id}`;
        return;
      }
      currentRound = nextRound;
      nextRound = [];
      index = 0;
    }

    const m1 = currentRound[index];
    const m2 = currentRound[index + 1];
    if (!m1 || !m2) return;

    progressEl.innerText = `${currentRound.length}강 ${Math.floor(index/2)+1}/${currentRound.length/2}`;

    render(leftEl, m1);
    render(rightEl, m2);

    leftEl.onclick = () => pickWinner(m1);
    rightEl.onclick = () => pickWinner(m2);
  }

  function pickWinner(movie) {
    nextRound.push(movie);
    index += 2;
    showMatch();
  }

  function render(el, movie) {
    el.innerHTML = `
      <img src="${movie.img}" alt="${movie.title}">
      <p>${movie.title}</p>
    `;
  }

  function shuffle(array) {
    const arr = array.slice();
    for (let i = arr.length-1; i>0; i--) {
      const j = Math.floor(Math.random()*(i+1));
      [arr[i], arr[j]] = [arr[j], arr[i]];
    }
    return arr;
  }
});
