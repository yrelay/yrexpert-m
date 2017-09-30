;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TORQY3^INT^1^59547,74875^0
TORQY3 ;
 
 
 
 
 
 N LILAB,TEMP,RI,LILA,GAM,R,O,NUET,ORD,NOMENC,RESPECT
 N AD,CONTR,SELEC,ABORT,DIA,TRANS,NU,I,Y1,N,CHOIX
 N %CUK,BASE,FILS,BASI
SU 
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,2,1,0,$$^%QZCHW("TRANSFERT TOTEM ----> DKBMS"))
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S CHOIX=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S @CHOIX="22^0^79"
 S @CHOIX@(1)=$$^%QZCHW("definition.composants")_"^"_"COMP"
 S @CHOIX@(1,"COM")=$$^%QZCHW("nomencl. : def. de listes d'individus, requetes, listes d'echange predefinies")
 S @CHOIX@(2)=$$^%QZCHW("activation.transfert")_"^"_"SU2"
 S @CHOIX@(2,"COM")=$$^%QZCHW("selection des etudes et activation du transfert")
 S @CHOIX@(3)=$$^%QZCHW("configuration.transfert")_"^"_"CONF"
 S @CHOIX@(3,"COM")=$$^%QZCHW("nom des attributs accueillant les valeurs sur les operations")
DIAL1 S DX=10,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,CHOIX,.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 I AD'="" G @AD
 G DIAL1
 
COMP 
 D CLEPAG^%VVIDEO,^%VCMS("TORQYC"),CLEPAG^%VVIDEO
 K CMS,ABENDSCR,SCR,RESUL,AFRESU,DEJALU,PATOUCH,%AJM,m
 G SU
 
CONF 
 D CONFIG^TORQY51
 G SU
 
SU2 
 
 S DX=10,DY=22 D CLEBAS^%VVIDEO
 S RI=$$RI^TORQXIN
 S SELEC=$$CONCAS^%QZCHAD(TEMP,"SELEC")
 D ETUDE^TORQY4(SELEC,.ABORT,.DIA) I ABORT=1 G SU
 
 
 
 S TRANS=$$CONCAS^%QZCHAD(TEMP,"TRANS") K @(TRANS)
 S NU="" F I=1:1 S NU=$O(@SELEC@(NU)) Q:NU=""  D AFFECT
 
 I DIA=1 S DX=0,DY=23 X XY S Y1=$$MES^%VZEOUI($$^%QZCHW("Activation du transfert"),$$^%QZCHW("O")) G:(Y1'=1)&(Y1'="OUI") SU
 
 S NUET="" F N=1:1 S NUET=$O(@TRANS@(NUET)) G:NUET="" SU D ORDRE
 
 
ORDRE 
 
 N ORD,O
 S ORD="" F O=1:1 S ORD=$O(@TRANS@(NUET,ORD)) Q:ORD=""  D REPIND
 Q
REPIND 
 
 N NU,TW,LIENOM,RRN,RRG
 D REAFF
 S %CUK=@TRANS@(NUET,ORD,"INDIVIDU")
 S BASE=@TRANS@(NUET,ORD,"REPERTOIRE")
 S FILS=$$NOMINT^%QSF($$^%QCAZG($$CONCAS^%QZCHAD(TRANS,NUET_","_ORD_","_"REPERTOIRE.FILS")))
 S BASI=$$NOMINT^%QSF(BASE)
 D LIEN^%QSGEST9(BASI,"GLOBAL")
 S TW=$$^%QSCALVA(RI,NUET,"COMPOSANTS.ETUDE")
 S NU=$$^%QSCALVA(RI,NUET,"NUMERO.ETUDE")
 S GAM=$$^%QSCALVA(RI,NUET,"GAMME")+0
 S RRG=$$^%QSCALIN(RI,NUET,"REPERTOIRE.RECEPTEUR.GAMME",ORD)
 S RESPECT=$$^%QSCALIN(RI,NUET,"RESPECT.NOMENCLATURE.EXISTANTE",ORD)
 D ^TORQY5(NU,TW,.LISTE,BASI,%CUK,GAM,$$NOMINT^%QSF(RRG),FILS,0,"",0)
REPIN2 S NOMENC=$$^%QSCALVA(RI,NUET,"NOMENCLATURE")+0
 S RRN=$$^%QSCALIN(RI,NUET,"REPERTOIRE.RECEPTEUR.NOMENCLATURE",ORD) Q:RRN=""
 S LIENOM=$$^%QSCALIN(RI,NUET,"NOMENCLATURE.LIEN",ORD) Q:LIENOM=""
 I $$TYPE^%QSGEST9(RRN,LIENOM)<4 Q
 I GAM,$$NOMINT^%QSF(RRN)=BASI,$$LIENPF^%QSGEL2($$NOMINT^%QSF(RRN),$$NOMINT^%QSF(RRG))="" Q
 I $$LIENPF^%QSGEL2($$NOMINT^%QSF(RRN),BASI)="",$$NOMINT^%QSF(RRG)=BASI Q
 
 I NOMENC=0 Q
 G ^TORQY31
 
 
AFFECT 
 
 N GLOBA,GLOBA1,GLOBA2,REP,IND,TYP,R
 D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR",.GLOBA,.TYP)
 S REP="" F R=1:1 S REP=$O(GLOBA(REP)) Q:REP=""  S @TRANS@(NU,R,"REPERTOIRE")=GLOBA(REP)
 D MV^%QSCALVA(RI,NU,"INDIVIDU.RECEPTEUR",.GLOBA1,.TYP)
 S IND="" F R=1:1 S IND=$O(GLOBA1(IND)) Q:IND=""  S @TRANS@(NU,R,"INDIVIDU")=GLOBA1(IND) D MOZ(GLOBA1(IND))
 D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR.OPERATION",.GLOBA2,.TYP)
 S IND="" F R=1:1 S IND=$O(GLOBA2(IND)) Q:IND=""  S @TRANS@(NU,R,"REPERTOIRE.FILS")=GLOBA2(IND)
 Q
MOZ(IND) 
 
 S REP=@TRANS@(NU,R,"REPERTOIRE")
 I $$EXIMOZ^%QSGEIND&$$DECLAR D CONNECT^%MZINIT(IND) S $P(^[QUI]MOZGARDE(IND),"^",19)=REP
 Q
DECLAR() 
 
 Q:$D(^TABIDENT(WHOIS,"MOZART",REP))!(REP="GAMME") 1
 Q 0
TRT S DX=0,DY=23 X XY S REP=$$^%VZECH2("OK pour le transfert de l'etude selectionnee "_NUET_" ","OUI","NON") G:REP="NON" FINI G:REP="OUI" OK
 G:CTRLA FINI G TRT
 
 
REAFF 
 D CLEPAG^%VVIDEO
 I '($D(^KLNTOT($J))) D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("TRANSFERT TOTEM --> DKBMS en cours ..")) G REAFF2
 D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("TRANSFERT en cours .."))
REAFF2 
 S DX=30,DY=10 X XY W $$^%QZCHW("etude")_" : "_NUET
 Q

