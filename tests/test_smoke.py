from src import main


def test_main_runs_without_error(capsys):
    main.main()
    captured = capsys.readouterr()
    assert "Lookinglass Playground is ready for development." in captured.out
