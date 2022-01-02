using System;
using System.IO;
using System.Linq;
using System.Collections.Generic; 

namespace Analyze_Music_Playlist
{
    public class Song
    {
        public string Name;
        public string Artist;
        public string Album;
        public string Genre;
        public int Size;
        public int Time;
        public int Year;
        public int Plays;

        public Song(string name, string artist, string album, string genre, int size, int time, int year, int plays)
        {
            Name = name;
            Artist = artist;
            Album = album;
            Genre = genre;
            Time = time;
            Size = size;
            Year = year;
            Plays = plays; 
        }

        override public string ToString ()
        {
            return String.Format($"Name: {0}, Artist: {1}, Genre: {2}, Size: {4}, Time: {5}, Year: {6}, Plays: {7}", Name, Artist, Genre, Size, Time, Year, Plays); 
        } 

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Music Playlist Analyzer");
            Console.ReadLine(); 
            


            if (args.Length != 2)
            {
                Console.WriteLine("File not found. Please place MusicPlaylistAnalyzer <music_playlist_file_path> <report_file_path>");
                Environment.Exit(0); 
            }

            string report = null; 
            List<Song> songL = new List<Song>();

            try
            {
                using (StreamReader sr = new StreamReader(args[0])) 
                {
                    var line = 0;
                    var row = 8;
                    sr.ReadLine(); 

                    while (sr.EndOfStream)
                    {
                        string line_ = sr.ReadLine();
                        line++;
                        string[] values = line_.Split('\t'); 

                        if (values.Length > 8)
                        {
                            Console.WriteLine($"Row {line} contains {values.Length} values. It should contain {row}.");
                            Environment.Exit(0); 
                        }

                        else if (values.Length < 8)
                        {
                            Console.WriteLine($"Row {line} contains {values.Length} values. It should contain {row}.");
                            Environment.Exit(0); 
                        }

                        else
                        {
                            Song data = new Song((values[0]), (values[1]), (values[2]), (values[3]), Int32.Parse(values[4]), Int32.Parse(values[5]), Int32.Parse(values[6]), Int32.Parse(values[7]));
                            songL.Add(data); 
                        }

                    } 

                    sr.Close(); 

                } // end using 
            } // end try 

            catch (Exception)
            {
                Console.WriteLine("Playlist data file can't be opened."); 
            } 

            try
            {
                using (StreamWriter sw = new StreamWriter(args[1]))
                {
                    Song[] songs = songL.ToArray(); 
                    Console.WriteLine("Music Playlist Report\n");

                    var plays = from Song in songs where Song.Plays >= 200 select Song;
                    report += "Songs that have received 200 or more plays:\n";

                    foreach (Song song in plays)
                    {
                        report += song + "\n"; 
                    }

                    var genreAlt = from Song in songs where Song.Genre == "Alternative" select Song;
                    int i = 0; 

                    foreach (Song song in genreAlt)
                    {
                        i++; 
                    }

                    report += $"There are {i} songs in the playlist with the genre of Alternative\n";

                    var hiphop = from Song in songs where Song.Genre == "Hip-Hop/Rap" select Song;
                    int x = 0; 

                    foreach (Song song in hiphop)
                    {
                        x++;
                    } // end foreach 

                    report += $"There are {x} songs in the playlist with the genre of Hip-Hop/Rap\n";

                    // question 4 
                    var fishbowl = from Song in songs where Song.Album == "Welcome to the Fishbowl" select Song;
                    report += "Songs from the album Welcome to the Fishbowl:\n";

                    foreach (Song song in fishbowl)
                    {
                        report += song + "\n"; 
                    } // end foreach 


                    var songs1970 = from Song in songs where Song.Year < 1970 select Song;
                    report += "Songs in playlist from before 1970: \n"; 

                    foreach (Song song in songs1970)
                    {
                        report += song + "\n"; 
                    }

                    var GreaterThan85 = from Song in songs where Song.Name.Length > 85 select Song;
                    report += "Song names in playlist containing more than 85 characters: \n"; 

                    foreach (Song song in GreaterThan85)
                    {
                        report += song + "\n"; 
                    }

                    var longest = from Song in songs orderby Song.Time descending select Song;
                    report += "Longest Song in the playlist: \n";
                    report += longest.First();


                    Console.WriteLine(report);
                    sw.Close(); 
                }

            }

            catch (Exception)
                {
                Console.WriteLine("File cannot be accessed or written to..."); 
            }

            Console.ReadLine(); 

        } 

    } 
    }
}
