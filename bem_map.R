library(tidyverse)
library(leaflet)
library(htmltools)
library(mapview)

load('data_map.RData')

data_map_video <- data_map %>%
  dplyr::filter(recurso == 'video') %>%
  mutate(arxivo = c('KUZ7JrLQjTs', 'QU1JYEPH_qE', '__1E9j3A5vw',
                    'fW8igd0gEu0', '-EdWdWt4124', 'NCZiN9OM9fk', '-3on7Soy-wg',
                    'ikF9ItIj-Xs', '3NBX8zVWaTs'),
         link = paste0('https://www.youtube.com/embed/',arxivo,'?autoplay=1'))

for (i in 1:length(data_map_video$link)) {
  data_map_video$link[i] <- mapview:::popupIframe(data_map_video$link[i])
}

# silvia ferrer foto
data_map[66, 'arxivo'] <- 'IMG_20180123_150141 - Sílvia Ferrer.jpg'

data_map_foto <- data_map %>%
  dplyr::filter(recurso == 'imagen') %>%
  dplyr::mutate(arxivo = stringr::str_replace(arxivo, '.JPG', '.jpg'),
                arxivo = stringr::str_replace(arxivo, '\n', ''),
                arxivo = stringr::str_replace(arxivo, "'", "_"),
                link = file.path('Photo', arxivo),
                link_2 = c(
                  'https://lh3.googleusercontent.com/0xey3zt1RWSAk6leqHKEJeKhn_scmMYkizp_QFDFB5Xi8gxSP-vI2wQr2s_JOztOJJVYvz9TcITGklppmsxpzeomjf-UUxB_h4kE5P95z7tL04VpTc1BXOr1osaVcQiMlN02aYyM-Uzk3jHHXZIxOj5URMzzemxS6f20uZ8Cmv_2gTb8RA-EcYKVTTc3nhISICnYUNqSzx6YHZJ0xqFXODpPIwp7tc1txUvNNKGbjk4QRTzV5f-RsCCWT_x_Butee7VvAoO1YBEo2ofVC_9iCtbF_kUtQ8XYXGiXWQDu3t_DfZV1lre7DWmGgcy4QMSBHhGVLPk4ndzz--lcKcxM8dPIl7L2nRne8Jaq3ZHc_D8H2ntHZFPsn-VhtT_4GMOW3sJnBb8Tw52LaWs-2yaQWY-zvGXX6WDUDLmRVVtsMz_-mJHYOmPsHBuV2GQS7Lh3MOrnpJBiprO3nW17FH5Ov2SiZmRXqONvSSLbUrjCZZT_bv34jiC1q4wm5mENZN0w8D5A7_N6PuyHWFYiece7hqoWN22Vb9_g0UeZJxcG3KZq42TV98zSIFkMfIqmj2oKKIcrMc5d4r_2EV6pPy4LhGFZDc3prM0H7iIuQjGaBq141Baeb0w7_B6ZPQUhLM3SG32h0Krwg5NvyGdkO66hy7mAWsAg3p5s=w2210-h1536-no',
                  '',
                  'https://lh3.googleusercontent.com/Ohyk0yJorK0MiV70rbCPGOHX08qM4pUZBOEHwDuQKjvS4-jHZXTaO4jB6jVROjufmKSAVRzhBjH7idCguW6i_qKhPYZtnZP7-EolxFZ5ZYPHxrHEtMjCsMcHkxVhQtByrQcTYZe2qzPhfAyw7kk76xxgdRuKv_FSMfVsK-S7cigIp_lOopKV96wrVhvO6M7aG035i_BQs87v0GuhfI3TTFV14-ysKlhm_GBslKjDUyP9WjDmYJCSlh6LON5tECFI5btwx0gCKR5sSMX-_QVHA6itB0kF9M2GLd2r61lu1Aag2iI2HuyWkdt5C5cfz8sY2I9_xBtDu5VJL1Z14IyaDkGLrUiWsbKWTg3jrLzYvxtwpJ6vQku9cHRJRb9QbLJVHT_VR3njuaZUiuNl9ZsXZtwOJBrvb4GWCNO1vsk07SUMr3yISWN9orbn8Y4BEFshCJ6Y05m1Hp7MlruMM9rvpzNGhqu6G61TELzc3cWRetphPvViL2QmRfxOegAyt-gbG_Hz7jucorlr1oGNTjEQIs1_LXTUpzASg2kuGRLqHv0CDur__3CBvyRfO65S_hre_xBWRhzHnFiacs2Nd8Y6rLFMzCAqBwAdrhOI24IOH6M_QupIKehbeLjoJHUCqZ0oIcV66KoSScmdubXn1NlK4Oig69aOsW4y=w819-h614-no',
                  'https://lh3.googleusercontent.com/2kI831HsE4ST0VToMVE8DULPdHDyS08uhZ24IZ4DodWIAXwmB0r8TXffcWm4Adk_oVzedInlCwuWbZTgumPJaXavaH0e2weFE_R0raMzl_vr_p-AWx5PyrkPbRmdLUqhCfJvql3U7igBDVSVzTZvVzYHrkjFnNUtQu7fIdbueGTt5soX_5PovI75tWWaE9mPonYcImBTThogy9qWzcj8oMc0l9OiD-QBnAJIgmBPCnFDJ0AIzdR6J6u49ze2A9me0LCmJtxAhXhn_iR7qpDZQN8498KTOfW54JD1PnNk7JlESuHZ0SBCYIzu8E98ns1zEDgz7L7OL-R_zGxJBKtJhMSAbOSAfmA1Ntrf9gsaIpLOJMbdIwnOsX8swzqM-pAyYRT7AIH8uKFsgOmbGBF4JSaoA4cvGluNIUHRrlBL-dY_z-o4JO0PfzY7-uooLW7meb8yqw3Z8lxZB0Frc0RI62BWhYfRJBEbnfrJXWqWXQbDBwzhL4AHOlUaWlYPS6OADiM5bxfx-efT7akhP6ma5MF1zbWjUfAekaibHAgyPzzUoW3zVfo3oyWElX6CVG7BR8O8mY2GzvvgfbV4lUmyVOvFdI47wLoWoHh_xlJFVbUIvnVOY2WSchtqh4qJgv1ABJ6EdphBwY0XdY2fhVJb7k_MGB5iKQxO=w1246-h747-no',
                  '',
                  'https://lh3.googleusercontent.com/znD58oXldgPZ2pyvXXNcCEGq3S9QV7a7tUNeWsPH9x7k881mFMrTfTmQMzWBoKAE8qF673UcPnpOf8NPZAmR5jkF8YVqRCSYcSqpsGID_JxjFdLif2TYrA31Ai4zxSjrMd7qhgfve8Akmr1Ao-QMdurq22lDu0gzHfryLzZ9WINvjyL7kyDtujIjz3BameLBWr5Eif7fpq-akAu_atuQhwrBYHAwrA5TQP2ICmnDVV6nF0ebMPdljh0tLahgV_aEiQkTtPJVBEGm-WwT57Ifu_ZxJEN01-9TEqBoD0DD2NkpBqUlJBJPGvsvGTPDrdBFsRQ5pC8L12yQmcaDhIotRhThL06VQixWbZwjWzsJfNPnnQwWmeBrsff_KqIxQBZ6dv6RhvhnnLeJqw54f--yP3ba5BZ1L_C19buAu98HqSoWFJMhWBT7KZWWjrCgYtZSd8hGNjuqOBmJfGvk2KQeN3XOQarUlqkL7O7X5lhNgpZ6suAIXguYb9lBA0RGUZMPkhWZHKL0D4JISX4KBUHXmXs1TUx7qiLM0LLjEqmXaBXGWS_Yv422a31Fl2yBfJoHqSw5-40TbobgU7E2nnjxWUe2E7nj3os3L9_mVGD-W4JR83HHGSLheTbXDrKeYyHtN960PmbQ4zGDA9Nz_8BLC-0FexHjVFDf=w1152-h1536-no',
                  'https://lh3.googleusercontent.com/nLhT9TtnlCgIEZ_rvoR33e72MCb56kcytS0R64w-XltqoD3OajPe2vU7YGXyNfmQ9mgqPBrkzCYylPXGQ1EoVXqxhfRc-LeiN7280786tZ8ME9AAyZv2FsrGh3KU6RfS2IebbcQyp5BV4_npE0ijTfgr237YVDFUHc_PFXemS60wwwLnAP98kX_SRM-yv3RpNzAAnHW1aJcL_92S8eYsq26v5R-bvZ_QEh1CBtIa2ERSG9gqoYhLYfC-n4D23CQ77ng3ptVnHQQvXPhkqlDkWncbyOmoGdSNch07XDrCvyHsGodATC2BtEFu90ZXAVc6MlWr5A_L_z8PHJmZbriknlZDdi3sWzUnLU-ihzWNgFA6YsYJ7LeoRxvRb8StKl48981VqjUoREFf-lnQuR1E0A4Ysc8K-xjPW_g1QaHDFyvTntBMp_JWcOZ5etsvrpQhV4lPfkLMTJQowtwppKZn_2LFf2ka2qrl7cwIKIMdnT8HnDlkt4gkNRg2yLpfHBqEOKI9W5r4jA4cAh7ocoImoccWvglmwKJq6FFWK1Tqe_3qpeS8_TkfHMpzZCvhNHq3bl6obn4NhTgs3PPQFfnov_f7idJ7btimSiPVuhsPwku6kwkyBK2CfhtPTyiC0cZ1mZI8YV4u8Xnp81wPKNXZM7_30QoKlTeg=w1599-h900-no',
                  'https://lh3.googleusercontent.com/3RVmZyPyDIxmiZETjjaoridml8WMri7iH3-HYAkXaYiB4NjOCpn59M7M7eEsntywVj95iyxDM44ycbchR9z7828e16K5iwV12t_1WXkfvi_eV3Ly9rLi9VnCO7VZ_5ifRm32Os1_rb8A6PXhjcNzLHuz7lmbWRuDNlnR8aWVGlL-3hnzAVORtrYNS714D3x03tu-45U--JIMIVtvBGVyM8FYTbaUEPF5mZr06mahSuHtNyCjRVnmD9qwA-b0zb4je0odDh8zD6BdAnf2XhF1Q-2Ycux-kHZ2_zs2eKh7yVL7gD47OUNmNJ_4P4pABcSw9tE4yGqRYRMiqc8_lDIKk_9jR5l0jFY-A7x8iSizM3lIInrc2EsB0N3WaBsOkKZG_Q0GSqQ-jVtJIaP-P8BSwXaV8SDpqOzzRDRxgV7N11BnGLnfFwHIKIssCKjzXMmOOaZQsenhnHcL4vcKE04s8ZylLVphhL0IdpT9wzqeOhCU_CCf80faevfNXgYEeAfwbqyzBZHnneHXgZB7vyNjg2dgBgCSRKxvgaw-mCd3oYyXAPgGRP9ummhd9JmeT4Aia91KsnglIPBEPZoXpIxK9O5UvbZdBzx4I46ReuVPWWK9FMuyMthA3EuAQdB3BnGk3niSj0e-C6oBSiwCgrTmqlm9p6mRNCpo=s1041-no',
                  'https://lh3.googleusercontent.com/caVkIYoLzicV4a6gcjpPpF9UbAqqXqhxgSgpWARTXibgFpfIux6DifW1njT3-qmIIQps7653UiyZZg8NCr1K8GzgRyU-BedXlIEvcIJHSU--9Bv6aOgpNDCuD_tGeNkBRjZgmujKzFIKrIdx9J6zV754-5qW4aITEd0mEDTsirBaS-VAV_sjxVuMjHYFKXutiD2ZgHYU_pdj-lbAfGcNcr57sb34VY1-GjGkEsizKQdcGn-z5gLlBuBomDRFfBplgGH7Ocifx_hx6Duyt98Mt4U1IbrVvncFrf6sfBkRWZy7ec3Kc9FTv5gNvs-lA7L5OYTff4oLS0KC5syL5Rz_6lCLIBNpxXWqPBfCEiB6MK0P5-xpPIc6tvec859NZH9nEBmoEHb01GQR5cw6F1chVQENVljJ2gYGaYjsUWhfq2_AdcdAXiu5SlYjFgcdLBA8uNgiBcvakm28WYs40B9L70KtXz3jFb97t4X1JHRCj632ubDT4FpAKV2xdaato0CX6CkJWw5Xe_b-_Ogc10itg903DxRjDJL8ZwUVFDuhd_lISafoQQDJ0kcCfrT3GfXBY016EGLBJmM2S7FBlTOCizXci9uyGVrUdi_RWjw6KRT1UIr6OLnBszLlUsmrHhiDpcHZNc1Fq7VZa1Dt8UoUASQ8vrc81iwH=w1440-h449-no',
                  'https://lh3.googleusercontent.com/agZ9wMzWAughrrt3frCNSXDmMEM-90HFXt4o2-6wCD7HdlxDJ8dkykSnumota26ligMvy6taoh3-njUEFkRf0u7JjOLYESqE2hfgxPc6NGtcBNxLTz-lrgsznDA5pRAVFCVY2o17xITnUg2xErYG5hCdKs7monwk-KE0vkQP4hGamW6SHg7PEgdSA4iZmx-rLNmAvQIeKIOJazppEDbgoYLOazL9JpbuDHevcleFKaM8PHUrvrOEMvZFHbYTlsyD8sQ4e8CwM6pkkF8lq2UI1v_XJ0782_eHLnzAjd6629UOVFpGiFL72bIWuvYTrDh9uXCjdx8skbtXcNF-x7nStyUMNUzmw1u0sImbGEct09dCHUP_hUCGrsXWD9Lbqt07z7n6veNZ1jbjWtRxf5hvYNfvbexwn4jOs9vjbkUbuVpqB55OD_OXOKRoJwIaOjs3FaONwVNqzTB_Rt5RmG6sGgr0Ruqy6z1Uwxtper7W1AaShGIpk3SheBd37wbU3V9QnZvGMWrlqZDOoo2Loblp6Cbfcg5SfGuY8m0QpzeY-4zEyG1Vb4W_2ZZMh4mQ5e-kVLeCrMvuNf1VWpXlloyxkdI5mBOs_oCBTydLgEmT6GmlQiTDVu5Tp0zq_UOWsv7waQJwgVzpIK10pQo-Jv3LZMwexpT6LvSq=w640-h480-no',
                  'https://lh3.googleusercontent.com/qtbJJKjYfOck1cr0F-dz7rMaegvXkkdc8hXVERfC-xZdcGOWIacivYstERIySxmJIzCelxM0_Dcm2fboCidU5fT3Gl-1wCpEXHFYk5mNpbTYR-IkM6BCCDxnjbg7dGAvS3QH7HQ4YGyKIR5n6H5_UlywPx3qZbjiPxWwYR59y374eMOL5qxCj6zMAbAkiqBMJUSkQcHK4mkBidgEZGKZ9URSEnbqnkb9zF92yZFsbmcudcsTa6kh7t8d1I5VLFrfShTBkqU3t9S-o16tEWl4WxU1FYsf-1v9yOpKcTLUqJGHKc9efv9DbxQy6cQwI5U-GaNvRJRHQFyRS-66tP7zYrHERjmVTDYrpIRe462Ee-fTpYOhOMkuv_OWmWawLZex3KDlPNHu63v9eSjHUq7kZTmB6Tt6aLuJHumxVyyd-TbDOTz6bzx3g1rU7Vc7wckawI_XQB5HtGl6DNi8iAnYyzmEbU8DsSz0M6cX_-TiPN8Tb2736xBhD31tic3YdTXtuOkvITkHnhX4PJ_66uKlA7WOi7Iduw1gZ9hO2hMOhmHw901vOGYFbUS3DNvj19HiXZRgcqKuKE5sQTq1ra34YqkgVzyEsW5CJTqZWdnPcV-bi5m8gh2zLRP3a_eEgXj-DXq_wHvbS8tOzzbO0FkY8-6ngvlHzINN=w2306-h1536-no',
                  'https://lh3.googleusercontent.com/OLobMTT5nVppomYzvWl0qHd1sGdj9IyxLb9RqjXL7xJWivWx_DXxQNKc901AYXmdQGp7qIPPHwQTfPmIT-iLDhO4v66z7XVDaRPY92GcDRhTZpb4FF79gKKSQPq7ezkmUrym0k8uyt3gaIGncjnVIvagy7j5-zkHzQwpB0Iszn14zZsP4qlHEG04e6xKlHbXOrMVZ7lSzoExxe_XPeLwSMlQMG30lN6NLVbO5zgQqOzG0oOmVvhDmkVUmfg02xmzxghCGs7ThTG2LMM68BT2BmjLnqZ2DoQv9P4HrRxyjPNOQ15OSoXK9ivpMOWmGJiJiIrCfkzMstR_Rqtuq9WwW-1JgSsFo-NJMSKufm4Z-VYOC2GZguoh_GuDvbfOerTKYwgzRmfKYDreK7OssD1ugh7KY_djDcSOjxGH0-QD5WHzENP2B1qX9vmkW4Q9gAI2zqm59mcq0-MHSiDzniH4YdiFBM45DDi-UJsT7oKYgxs9iYwcbWZyEYAEgi3Lyvr-HgeMTEfTjr0H3zz5xwl-oLPSd7upmovi7-V0peDW0jVvWbhebWAgGBC6WZKIzzm91_KZEdr6JBfwSD8EET3Y3wjn9GgGfOuKNEX6s09eolFuWSCtkYF1nmPW-MVkMFkv-_D85av0eR4wI6XjEJW_VdPSrDHLPCcU=w320-h240-no',
                  'https://lh3.googleusercontent.com/gHtE42CM-DfiREaAbBYBcYjfIPSrYg0UnE7eoOuK6jhQuNVen6PN_XTdSVjbXw_yoeDiDNgGlCN9WP03pjGLLnqH_TyIFT6vg6sl0sTpSN0LFZeRybHsHk4_LYHc_7e1rivI0jW7PMhvP6Y2YYIgWFpVEX-f0r7P07_8txHGEs5Hs83idUe0s0cIgQqYEVWu0qDWUcbQHb3a9btO5dwUsCQwuyiSrIrxFu-VktyqG1PxYGQ3SbhoMEJ0BlwYbVoaxzX36WZbuXpHSg9ulXVrNGENYBtyDbHEbPXgfeHCwghzspBXq8APcPVauKuUKBdzFDpwtCmT7UL1uY6F4ljv4riwRVK2lUXKtqGWGQAhMWnaEDiF2tvDqW39IjSdFHVTxJhwzktlJA1ujig94AQSccSOAtMuoC9zuwusmVoG76hmypLtgNfBhvmnj-0wKrR2kS1-4eELfWuJc6iJ7wKTUOOfJhy6VDZxRIvi2qPOlzUp00iiShTABKbFd0sfHrscypuFxWHO56Z9fgq5WfPKXwmmhQilBMFIcd2yjUtkZ80kYrRmX72Itq162_qErjp1CjLCP4FkVHTeG2wkE6R_SikIOgdUWy3R7OBH8TlSwNQY-9voyRWwZI7I-Xyo-xd68zDBd3x3FbaAG4avPUWJ8LhBe0rCUI3g=s1536-no',
                  'https://lh3.googleusercontent.com/-UgAhMfwHeChu1aGKXgl1YjXSZP9zgck6zyUIP7cJNuCf_5do5ixHoXluudPXXQmurkSGOYd_DnTnqHGlbEOzIt1J91fqnYDbhf4uwCgmedQKh6LgYjbM-9_rryQKnUf6LvyoD86SK7XUkeMnK3oJ2tD67R76hsHc7ECwef1NbI56XAYZQyPUytGOKMNROMe8Di5KQpsN3PluAF4viLH48YsgD8MhJGteRHekj5QY1bd7Y158-6Idn_o_RmLPlqSENswEeShDavth_2OEr6MkjRKCz4v0VlTdA0BFZUnuDe0fEeLIsizMkLWFk_LiNQ_YJkP_6VsJ88cMC8Ha5TnPf1jECRolD5Niy1-21pfjYUiFiLbxCarBMMfVCaqpPfrB6Ws6bMuOt555NRo5ZhW8Hm-IXGgDlct0oh6MHPvubtcruIX-dm9MjuxamJfh8hunvd4S1Xb-UML-0yu1t6G2qVqgs06nc-YOODRyAZGygx0_Y5CNZ26iuzaKiDk9kPIipolVVFlN_5tHoEP7RGeFl6rtN3dUIsG19Asdl9bam7MfFAXuoLSJVzjgm-SLn1SZqfHOi7uLzF50rhM6_66UanU8aV_ivW0Mp4NeY1tHwwoLP077FJ2RaGm7Er84EJtDn5PojqZsRJ8ehyKD68-srcjjHnO9NWP=w720-h480-no',
                  'https://lh3.googleusercontent.com/e0LaGVf1mvXyqoRKj4hWDYpErCLAuCS-3sLuGOhSgCKlgjY28sap6Jk0MxqZN9dDKZd1D23n05nWN4FEOBDj8AQxYiRV2yCMM-5QAjb73m5V52757OFkHGA7XBrCmt4ROGiU6TF2B_1lZ5M5enSJ8yCeXhuMFxQmDtB8DaTlzaCs3T_cXhhr2V2PYqZJMY6BkDQw91Ay6y_53PCfS4gl994Sc4vSS1xgeFU4HwYavUDdKNlzNK9sUxSX1tCgQrQA8-0oFGHnoeWW43U_bLZX8Mf90cr2GCA0EhJXYI_2_kssjpVa0i8s5poh-G9D5P4H_g_g5yqL2b94xu5jeMNDJOvtEaarijdOHx0GVLiMYYiR-XJpJacujK2lnJ3n7nTQ0hA_vNHq3sDD63Ia8GraWwa10N5dYe1FWb2zmvJ_Vf4Hz0QefZOw8a68csRF7iVPsyJn4qTVuEwzcbVXYqEaEQx7k0x3iiBMgW9vl639RnW05cW9vNI5_9dkLrrP5tOEUTdh6qem5ZQ4nnVSvxGrzkiouJ3rDZx0uoB5clkJrdcIRgbsBals-f2xTaOypfTFs4KgoiuqIMKVN2OyU1M_Uj6K3l06UxPTmOP43zd3An9w7H9UAhzaupNxrDIWzRiWnqeaHqAYueOwUFGhlE_8YFMgOHAq5Vpx=w2320-h1536-no',
                  'https://lh3.googleusercontent.com/AWQWz1ZzKV9Veu_QtuELB2bEIMySH_rAHTyDFJxbbs9dlcQL1_2n7tSOlVk8E-FbvXykknaLf2BDwCq-vyB6FSFukewrYfT02PVrRcX6EYHfW7YC8kG-Q8CO-WZcqB43dlNzvgPQo-xbS1wVP8_Ch8aNhAoEP3oPXrnBMdOy4MrhjYsgWOFJJ7pcoIGwuOUGdBwWE5YpHMqGoT0Snrkihc4yP4SI84xUgOSHIdzN1cDGu_ZRsnjnzO93GqT77FB0RCcnRItLPoXDHbsOiuu7HRPsqYZye81rY-Me4_NpHBS8VLznAb772MR9_LM62QQcQUpZ2e37w-b5PF65TGq2MEQbjXT66xz--N0buVAtz_f07uzwqDY0S2BstwvGndvuxvrFmfglsgku1IZsxLagQX5c2bEJVBKT2LBcwJaTM_VrocsWN0JyhmElNGw-rinFwrSA1lzRAr5y925-HkWY9RUJKksNmIHO7JbQx5rFM__aaChE5Xikou2smtjS1kaDrSbAShQB8AhDlT_XeOkXdehdanp6crgFnqyBfCWnvo5AL5GQN4MWkgfB1vOLIfwq3CFZwc40S1nG2CVoN6MwH5rXQEyOelh-0YlD0HDU9ARgLeqWXb0G5RBryteTfZe4P4BS2huzJPB9Ko3odXg_NB7hjP--G6nh=w720-h1280-no',
                  'https://lh3.googleusercontent.com/viA3A8T6-urK6HLbKWlWKd6VcRMTiXrBhLyXgC96CqWL6JlP75ZUogzuEEZS3FNSc2Fbfys52CUVI5ZGuFwdo8mQXZ4N9U7279Yc7fKmX_raF07W2rtDMv9NRHKV3x4a-kVsMbvOb95IvWfuKVzLPAnNHHdJjQiFv0v7p2QWhOECaPubOWHQnhFVZLudNEq5WcpbB_INCPcJugncg8lgtpRa7j5ILSt8xWR6YsKkQQtekD0oIutnXXJoEYshgNRdPSM2Dfu5Z9L2A5lrWTbFBQD82nJW_cZZjE_49nRp4HXb2qNKQccQpBm4D9YDP5mK4xoO4WqAdK-nw_Zalzk72j0bEv5HQTe4IouZLF2YHfdXF1PBA0Bh6Ud1TkBj-tUdeDNB77bzQd_vx9dn8oOjbiaYo-YycgRW952TsoZcDa8Z84TGwK592U5EAumq0dP8Bgt3uzRYgghyGsLmJqsIS0wSYl3yxEuf5td7dG3a7nbZD96nxRUTkqmRBAXEzZ2mCYIKEh5i0OtQhMxfLC67tb5lYjrL5aYzxXvD8EpIyvCrl3a1KNkCJdVSANgRz_xnw_eIturbUtD4VQWl3-t4YUtKRCUrH4iig3VbrzKZVnzRcLswSuCuDaKx5hSHUr0xJ4I8LDYHmaQna9MZ8rqUlfPA6ayjcdlt=w1152-h1536-no'
                ),
                width = 450) %>%
  dplyr::slice(-2)

data_map_foto[12, 'lat'] <- 41.85
data_map_foto[12, 'long'] <- 2.42


data_map_text <- data_map %>%
  dplyr::filter(recurso == 'text', !is.na(Texto_OK))

map_video <- data_map_video %>%
  leaflet(options = leafletOptions(worldCopyJump = TRUE, scales = 100)) %>%
  addProviderTiles(
    provider = 'Stamen.Watercolor'
  ) %>%
  addCircleMarkers(~long, ~lat, popup = ~link,
                   color = '#F03434',
                   fillOpacity = 0.65, stroke = FALSE, radius = 12) %>%
  addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(1); }")
  ))

map_foto <- data_map_foto %>%
  leaflet(options = leafletOptions(worldCopyJump = TRUE, scales = 100)) %>%
  addProviderTiles(
    provider = 'Stamen.Watercolor'
  ) %>%
  addCircleMarkers(~long, ~lat, popup = ~mapview::popupImage(link),
                   color = '#00E640',
                   fillOpacity = 0.65, stroke = FALSE, radius = 12) %>%
  addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(1); }")
  ))

map_text <- data_map_text %>%
  leaflet(options = leafletOptions(worldCopyJump = TRUE, scales = 100)) %>%
  addProviderTiles(
    provider = 'Stamen.Watercolor'
  ) %>%
  addCircleMarkers(~long, ~lat, popup = ~Texto_OK,
                   color = '#947CB0',
                   fillOpacity = 0.65, stroke = FALSE, radius = 12) %>%
  addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(1); }")
  ))

global_map <- data_map_video %>%
  leaflet(options = leafletOptions(worldCopyJump = TRUE, scales = 100)) %>%
  addProviderTiles(
    provider = 'Stamen.Watercolor'
  ) %>%
  addCircleMarkers(~long, ~lat, popup = ~link,
                   color = '#F03434', label = ~htmlEscape(paste(NOMBRE, BOSC, sep = '\n')),
                   fillOpacity = 0.85, stroke = FALSE, radius = 12) %>%
  addCircleMarkers(data = data_map_foto,
                   ~long, ~lat, popup =  ~mapview::popupImage(link_2, src = 'remote', width = 450),
                   color = '#00E640', label = ~htmlEscape(paste(NOMBRE, BOSC, sep = '\n')),
                   fillOpacity = 0.85, stroke = FALSE, radius = 12) %>%
  addCircleMarkers(data = data_map_text,
                   ~long, ~lat, popup = ~Texto_OK,
                   color = '#947CB0', label = ~htmlEscape(paste(NOMBRE, BOSC, sep = '\n')),
                   fillOpacity = 0.85, stroke = FALSE, radius = 12) %>%
  addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(3); }")
  )) %>%
  addLegend(
    position = 'bottomright',
    pal = colorFactor(palette = c('#00E640', '#947CB0', '#F03434'),
                      domain = c('video', 'texto', 'imatge')),
    values = c('video', 'texto', 'imatge'),
    opacity = 1
  )

# global_map

save(global_map, file = 'global_map.RData')
