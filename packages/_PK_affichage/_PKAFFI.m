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

;%PKAFFI^INT^1^59547,73874^0
PKAFFI(MODE,MODEG,REAFF,GLO,GLOCH,ERRGL) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N Y,%X,X,%R,NBC,L,I,X,TC,ARRET,ABANDON,PCLE,CLE,CLE2,CTR
 N GL,GL2,CH,ML,%I,%L,ESC,INS,%I,%J,%C,LNG,X,B,%L,PREC,SUIV
 N POSY,%IC,%LNG,PROMPT,MAX,MIN,CHR,PAT,TRM,ZF,VAL,SANSCLE
 S %RI=@GLO@("V"),SANSCLE=0
 S ERRGL=0,NBC=@GLO@("NBC"),L=@GLO@("L")
 D:'($D(^%PKLOAD)) LOAD^%PKGLOB
 X ^%PKLOAD
 G @ERRGL
 
0 
 D PARAM^%PKPOP(.Y)
 I CTR=-1 G 3
ST0 
 Q
 
1 
 G:MODEG=0 0
 D ERR($$^%QZCHW("Pas d'informations correspondant aux cles"),1)
 G 0
 
2 
 G:MODEG=0 0
 D ERR($$^%QZCHW("cles incompletes"),1)
 G 0
 
3 
 S ERRGL=3
 Q:MODEG=0
 D ERR($$^%QZCHW("probleme d'affichage"),0)
 Q
ERR(MERR,REAF) 
 I REAF S %R=%RI D PARAM^%PKPOP(.Y)
 D ^%VSQUEAK
 D PARAM^%PKPOP(@GLO@("H")_"\CHRL\1\\\"_MERR_"*")
 S %R=%RI
 Q:'(REAF)
 D PARAM^%PKPOP(.Y)
 S %R=%RI
 Q

