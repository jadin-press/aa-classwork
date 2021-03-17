class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

  // bindEvents() {}

  // makeMove($square) {}

  this.setupBoard()
  }



  setupBoard() {
    let $ul = $("<ul>");
    for (let i = 0; i < 9; i++) {
      let $li = $("<li>");
      $ul.append($li);
    };
    this.$el.append($ul);
}


}

module.exports = View;

