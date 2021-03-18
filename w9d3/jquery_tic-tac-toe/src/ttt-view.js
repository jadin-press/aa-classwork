class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  this.bindEvents();
  this.setupBoard();
  }

  bindEvents() {
    this.$el.on("click", "li", ( event => {
      const $square = $(event.currentTarget);
      this.makeMove($square);
    }));

  }
  makeMove($square) {
    const pos = $square.data("pos");
    const currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove(pos);
    } catch (e) {
      alert("This " + e.msg.toLowerCase());
      return;
    }

    $square.addClass(currentPlayer);

    if (this.game.isOver()) {
      // cleanup click handlers.
      this.$el.off("click");
      this.$el.addClass("game-over");

      const winner = this.game.winner();
      const $figcaption = $("<figcaption>");

      if (winner) {
        this.$el.addClass(`winner-${winner}`);
        $figcaption.html(`You win, ${winner}!`);
      } else {
        $figcaption.html("It's a draw!");
      }

      this.$el.append($figcaption);
    }
  }

  setupBoard() {
    let $ul = $("<ul>");
    for (let i = 0; i < 3; i++) {
      let $li = $("<li>");
      $li.data("pos", [i, 0]);
      $li.data("pos", [i, 1]);
      $li.data("pos", [i, 2]);

      $ul.append($li);
    };
    this.$el.append($ul);
  }


}

module.exports = View;

