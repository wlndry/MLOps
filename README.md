# Submission 1: Deteksi Penyakit Jantung Menggunakan TFX Pipeline

**Nama:** Wulandari  
**Username Dicoding:** wlndry

| Kategori | Deskripsi |
|----------|-----------|
| **Dataset** | [Heart Disease UCI](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction) |
| **Masalah** | Penyakit jantung merupakan penyebab utama kematian di seluruh dunia. Deteksi dini terhadap kemungkinan penyakit jantung sangat penting agar pasien dapat segera mendapatkan penanganan medis yang tepat. Proyek ini bertujuan untuk membangun sistem klasifikasi berbasis machine learning untuk memprediksi apakah seseorang berisiko mengalami penyakit jantung berdasarkan data rekam medis. |
| **Solusi Machine Learning** | Membangun pipeline machine learning menggunakan TFX (TensorFlow Extended) untuk mendeteksi penyakit jantung. Pipeline ini mencakup komponen ingest data, transformasi fitur, pelatihan model, tuning, evaluasi, hingga deployment model dengan TensorFlow Serving. Model klasifikasi biner digunakan untuk memprediksi kolom `HeartDisease` (1 = positif, 0 = negatif). Target akhir adalah membuat model dengan akurasi tinggi dan siap di-deploy untuk penggunaan nyata. |
| **Metode Pengolahan** | Fitur numerik (misal: `Age`, `Cholesterol`, `MaxHR`) diproses menggunakan `tft.scale_to_z_score` untuk normalisasi. Fitur kategorikal (misal: `Sex`, `ChestPainType`, `ST_Slope`) diproses menggunakan `tft.compute_and_apply_vocabulary` setelah diubah menjadi string dan dibersihkan. Label `HeartDisease` dikonversi menjadi `int64`. |
| **Arsitektur Model** | Model dibangun menggunakan TensorFlow Keras API. Input layer mencakup semua fitur yang telah ditransformasi. Seluruh input digabung menggunakan `concatenate`, lalu dilanjutkan dengan dua hidden layer dense berukuran 64 dan 32 unit dengan aktivasi ReLU. Output layer menggunakan aktivasi sigmoid untuk klasifikasi biner. |
| **Metrik Evaluasi** | Model dievaluasi menggunakan metrik `accuracy` selama pelatihan. Selain itu, dilakukan evaluasi dengan TensorFlow Model Analysis (TFMA) untuk melihat distribusi performa model berdasarkan fitur tertentu. |
| **Performa Model** | Model mencapai akurasi validasi sekitar 87% setelah pelatihan selama 10 epoch.
