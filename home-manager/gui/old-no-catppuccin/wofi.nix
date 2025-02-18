{
  programs.wofi = {
    enable = true;
    style = ''
      window{
          border: solid 2px rgba(127,255,212,0.9);
          border-radius: 10px;
          background-color:rgba(0,0,0,0.5)
      }

      #input {
          border: none;
          border-bottom:solid 2px rgba(127,255,212,0.9);
          border-radius:0;
          background-color:rgba(0,0,0,0);
          margin: 2px;
      }

      #scroll {
          border: none;
          background-color: rgba(0,0,0,0);
      }

      #text {
          font-family:"Fira Code";
          color: #ffffff;
      }

      #entry:selected {
          background-color: rgba(0,0,0,0.5);
          border:none;
          border-radius:0;
          margin: 2px;
      }

      #text:selected {
          background-color: rgba(0,0,0,0);
          border:none;
      }
    '';
  };
}
