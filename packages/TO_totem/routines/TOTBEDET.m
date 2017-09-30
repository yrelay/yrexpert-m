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

;TOTBEDET^INT^1^59547,74875^0
TOTBEDET ;
 
 
 S DXG=0,DXD=78,DYH=0,DYB=4,GRAPH=0,MSG=$$^%QZCHW("RESULTATS ETUDE ")_%ETUD_$$^%QZCHW(" SUR ARTICLE ")_%ART D CLEPAG^%VVIDEO,TO4^%VZCD G:'($D(^[QUI]TOIVANTE(0,%ETUD,%ART))) ERRPAR
LECSUP S DX=0,DY=12 D CLEBAS^%VVIDEO W $$L19^%QSLIB1 S DX=$X D ^TOLECONE G:CTRLA!CTRLF FIN G:(Y1'=$$^%QZCHW("E"))&(Y1'=$$^%QZCHW("I")) LECSUP S SUP=Y1,LILIM=$S(SUP=$$^%QZCHW("E"):21,$D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-5,1:60)
 S DX=0,DY=6 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Un instant ...") S IDF=^[QUI]TOIVANTE(0,%ETUD,%ART,0),EGAP=1,POSY=7,^AFFPAG($I,EGAP,POSY)=$$^%QZCHW("Etude ")_%ETUD_$$^%QZCHW(" sur article ")_%ART_$$^%QZCHW(" du ")_$P(IDF,"^",2),POSY=POSY+1
 S ^AFFPAG($I,EGAP,POSY)="",POSY=POSY+1,^AFFPAG($I,EGAP,POSY)=$$^%QZCHW("Commencee a ")_$P(IDF,"^",3)_$$^%QZCHW(" terminee a ")_$P(IDF,"^",4),POSY=POSY+1,^AFFPAG($I,EGAP,POSY)="",POSY=POSY+1
 S ^AFFPAG($I,EGAP,POSY)=$$^%QZCHW("Idf TOTEM : ")_$P(IDF,"^",1),POSY=POSY+1,^AFFPAG($I,EGAP,POSY)="",POSY=POSY+1
 F BUT=1:1 Q:'($D(^[QUI]TOIVANTE(0,%ETUD,%ART,BUT)))  S ^AFFPAG($I,EGAP,POSY)=$$^%QZCHW("                 But no ")_BUT_" = "_$P(^[QUI]TOIVANTE(0,%ETUD,%ART,BUT),"~",1)_"/"_$P(^[QUI]TOIVANTE(0,%ETUD,%ART,BUT),"~",2) D INCR
 S EGAP=EGAP+1,POSY=8,^AFFPAG($I,EGAP,7)=$$^%QZCHW("Liste des attributs calcules sans matiere ....................................."),^AFFPAG($I,EGAP,8)=""
 S MAT=0,D=-1 F %D=0:0 S D=$N(^[QUI]EVBACK(%ETUD,0,D)) Q:D=-1  D INCR S ^AFFPAG($I,EGAP,POSY)=$$^%QZCHW("            <<< Domaine : ")_D_$$^%QZCHW(" >>>") D INCR S ^AFFPAG($I,EGAP,POSY)="" D INCR,SSMAT
 S MAT=-1 F %MMAT=1:1 S MAT=$N(^[QUI]EVBACK(%ETUD,MAT)) Q:MAT=-1  D:MAT>0 TMAT
 G @SUP
E D ^TOPAGIN G FIN
I D ZD^%QMDATE4,^%QMDAK0 S IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0),DOLARI=$I O IMPR U IMPR
 S EGAP=-1 F EGP=1:1 S EGAP=$N(^AFFPAG(DOLARI,EGAP)) Q:EGAP=-1  D ENTET S POSY=-1 F YSOP=1:1 S POSY=$N(^AFFPAG(DOLARI,EGAP,POSY)) Q:POSY=-1  W !,^AFFPAG(DOLARI,EGAP,POSY)
 W #,! C IMPR G FIN
FIN K ^AFFPAG($I),BIDON,BUT,DXD,DXG,DYB,DYH,EGAP,GRAPH,IDF,MSG,POSY,EGP,YSOP Q
ENTET W #,!,$$^%QZCHW("Le : "),%DAT,$$^%QZCHW(" a : "),HEURE,?65,$$^%QZCHW("Page : "),EGAP,!,?40-($L(MSG)\2),MSG,! H 5
 Q
ERRPAR D POCLEPA^%VVIDEO W $$^%QZCHW("Etude et/ou article inconnu ... [RETURN]") R *BIDON G FIN
INCR S POSY=POSY+1 S:POSY>LILIM EGAP=EGAP+1,POSY=7 Q
SSMAT S A=-1 F %A=0:0 S A=$N(^[QUI]EVBACK(%ETUD,MAT,D,A)) Q:A=-1  S ^AFFPAG($I,EGAP,POSY)=$$^%QZCHW("Attribut : ")_A D INCR S ^AFFPAG($I,EGAP,POSY)=$$^%QZCHW("    ==> Valeur : ")_^[QUI]EVBACK(%ETUD,MAT,D,A) D INCR S ^AFFPAG($I,EGAP,POSY)="" D INCR
 Q
TMAT S EGAP=EGAP+1,POSY=9,^AFFPAG($I,EGAP,7)=$$^%QZCHW("Liste des attributs evalues dans le contexte matiere ")_^[QUI]EVBACK(%ETUD,MAT,$$^%QZCHW("IMPLICI"),$$^%QZCHW("MATIERE")),^AFFPAG($I,EGAP,8)=""
 S D=-1 F %D=0:0 S D=$N(^[QUI]EVBACK(%ETUD,MAT,D)) Q:D=-1  D INCR S ^AFFPAG($I,EGAP,POSY)=$$^%QZCHW("            <<< Domaine : ")_D_$$^%QZCHW(" >>>") D INCR S ^AFFPAG($I,EGAP,POSY)="" D INCR,SSMAT
 Q
 
TEST W !,$$^%QZCHW("Etude METxxx : ") R %ETUD Q:%ETUD=""
 W !,$$^%QZCHW("Article de l'etude : ") R %ART Q:%ART=""
 D TOTBEDET G TEST

