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

;%TLTRDIA^INT^1^59547,74031^0
TLTRDIA(NOM,NJEU) 
 
 
 
 
 N BASE,INDIVIDU,ADR
 S BID="INVISIBLE"
 
 S BASE=CXT("@","BASE"),INDIVIDU=CXT("@","OBJET")
 G EXT1
EXT(NOM,BASE,INDIVIDU,NJEU) 
EXT1 S:'($D(NJEU)) NJEU="" D DIALOGUE^%QSATTRI(INDIVIDU,BASE,NOM,NJEU)
 I $$^%QCAZG("MODAF")'="" D CLEPAG^%VVIDEO,REAFF^%TLUTIL
 Q
JEUVAL 
 D ^%VZEATT S DIA=@COL2@(%L)
 D:$D(^[QUI]TLDIALF(DIA)) CHOIXJ^%TLTRDIA(DIA,.NJEU)
 S REAFF=0,SORTIE=1
 Q
CHOIXJ(DIA,NJEU) 
 N TEMP,COL,LARG,VU
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S COL=$$CONCAS^%QZCHAD(TEMP,"COL")
 S LARG=$$CONCAS^%QZCHAD(TEMP,"LARG")
 S VU=$$CONCAS^%QZCHAD(TEMP,"VU")
 S @COL@("MSG")=$$^%QZCHW("Dialogue")_" : "_DIA
 S @COL@("TITC")=$$^%QZCHW("Nom jeu de valeur")
 S @COL@("PROG")=""
 S @COL@("INTER")=1
 S @COL@("SELECT1")=1
 S @COL@("MODI")=1
 D CLEPAG^%VVIDEO
 D SELINDI
 K @(COL),@(LARG),@(VU) S NJEU=%SELECT Q
SELINDI 
 N LO,L,ATT,NUM,N,NN,F,FF,FFF,FICH,TYP,JEU,CH,ATTS,SL,NBATT
 S LO=0,COL=COL
 
 S L=0,FICH=""
 F F=1:1 S FICH=$O(^[QUI]TLDIALF(DIA,FICH)) Q:FICH=""  S TYP="" F FF=1:1 S TYP=$O(^[QUI]TLDIALF(DIA,FICH,TYP)) Q:TYP=""  S JEU="" F FFF=1:1 S JEU=$O(^[QUI]TLDIALF(DIA,FICH,TYP,JEU)) Q:JEU=""  D TI
 K @(VU)
 S LO=LO\1,@COL@("LGC")=LO,NN=1
 S NUM="" F N=1:1 S NUM=$O(@COL@(NUM)) Q:NUM=""  Q:NUM="COL"  S ATT="" F NN=NN:1 S ATT=$O(@COL@(NUM,ATT)) Q:ATT=""  S:$D(@VU@(ATT)) NN=NN-1 I '($D(@VU@(ATT))) S @COL@("COL",NN)=$$^%QZCHW(ATT)_"^"_@LARG@(ATT)_"^"_ATT,@VU@(ATT)=""
 K @(VU),@(LARG),%SELECT
 D ^%QUKOLO
 Q
TI 
 S CH=^[QUI]TLDIALF(DIA,FICH,TYP,JEU)
 I '($D(@VU@(JEU))) S L=L+1,@COL@(L)=JEU
 I $D(@VU@(JEU)) S SL=L,L=@VU@(JEU)
 S LO=((LO*(L-1))+$L(@COL@(L)))/L
 S ATTS=^[QUI]TLDIAL(DIA,FICH,TYP),NBATT=$L(ATTS,"^")
 F TI=1:1:NBATT S ATT=$P(ATTS,"^",TI) D:ATT'="" TRAIT
 I $D(@VU@(JEU)) S L=SL Q
 S @VU@(JEU)=L
 Q
TRAIT S @COL@(L,ATT)=$P(CH,"^",TI)
 I '($D(@LARG@(ATT))) S @LARG@(ATT)=$L(@COL@(L,ATT))+2 S:@LARG@(ATT)=2 @LARG@(ATT)=$L(ATT) Q
 S:$L(@COL@(L,ATT))>@LARG@(ATT) @LARG@(ATT)=$L(@COL@(L,ATT))
 Q
 
CHOIXD(DIA) 
 N TEMP,COL2,LARG,VU
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S COL2=$$CONCAS^%QZCHAD(TEMP,"COL2")
 S LARG2=$$CONCAS^%QZCHAD(TEMP,"LARG2")
 S VU2=$$CONCAS^%QZCHAD(TEMP,"VU2")
 S @COL2@("MSG")=$$^%QZCHW("Dialogues")
 S @COL2@("TITC")=$$^%QZCHW("Nom dialogues")
 S @COL2@("PROG")="JEUVAL^%TLTRDIA"
 S @COL2@("INTER")=1
 S @COL2@("MODI")=1
 D CLEPAG^%VVIDEO
 D SELIND
 K @(TEMP)
 Q
SELIND 
 N LO,L,ATT,NUM,N,NN,F,FF,FFF,FICH,TYP,JEU,CH,ATTS,SL,NBATT
 S LO=0,COL=COL2
 
 S L=0,DIA=""
 F F=1:1 S DIA=$O(^[QUI]TLDIAL(DIA)) Q:DIA=""  S FICH="" F FF=1:1 S FICH=$O(^[QUI]TLDIAL(DIA,FICH)) Q:FICH=""  S TYP="" F FFF=1:1 S TYP=$O(^[QUI]TLDIAL(DIA,FICH,TYP)) Q:TYP=""  D TI2
 K @(VU2)
 S LO=LO\1,@COL2@("LGC")=LO,NN=1
 S NUM="" F N=1:1 S NUM=$O(@COL2@(NUM)) Q:NUM=""  Q:NUM="COL"  S ATT="" F NN=NN:1 S ATT=$O(@COL2@(NUM,ATT)) Q:ATT=""  S:$D(@VU2@(ATT)) NN=NN-1 I '($D(@VU2@(ATT))) S @COL2@("COL",NN)=$$^%QZCHW(ATT)_"^"_@LARG2@(ATT)_"^"_ATT,@VU2@(ATT)=""
 K %SELECT,@(VU2),@(LARG2)
 D ^%QUKOLO
 Q
TI2 
 S CH=^[QUI]TLDIAL(DIA,FICH,TYP)
 I '($D(@VU2@(DIA))) S NB=0,L=L+1,@COL2@(L)=DIA
 I $D(@VU2@(DIA)) S SL=L,L=@VU2@(DIA)
 S LO=((LO*(L-1))+$L(@COL2@(L)))/L
 S NBATT=$L(CH,"^")
 F TI=1:1:NBATT S ATT=$P(CH,"^",TI) D:ATT'="" TRAIT2
 I $D(@VU2@(DIA)) S L=SL Q
 S @VU2@(DIA)=L Q
TRAIT2 S NB=NB+1,@COL2@(L,"ATT"_NB)=$P(CH,"^",TI)
 I '($D(@LARG2@("ATT"_NB))) S @LARG2@("ATT"_NB)=$L(@COL2@(L,"ATT"_NB))+2 Q
 S:$L(@COL2@(L,"ATT"_NB))>@LARG2@("ATT"_NB) @LARG2@("ATT"_NB)=$L(@COL2@(L,"ATT"_NB))
 Q

