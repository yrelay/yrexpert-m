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
;! Nomprog     : %SGNETQI                                                     !
;! Module      : SYSTEME GENERAL                                              !
;! But         : Nettoyage de la partition de donnees courante.               !
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
;! HL002 ! HL     ! 04/09/09 ! Pour éviter la coupure de la ligne.            !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SGNETQI^INT^1^59547,73890^0
%SGNETQI ;;04:49 PM  2 Nov 1993; ; 02 Nov 93  4:56 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N Y1,CLE,I,J,SCR,GLOBAL,AGLOBAL,ZGLOBAL,IL,CH,GL,IG
 D CLEPAG^%VVIDEO,^%VZCD0("GESTION DU DISQUE")
 ;HL002 D NORM^%VVIDEO W !,!,!,!,"Assurez-vous qu'il n'y a pas d'utilisateurs actuellement connectes sur la base "_QUI H 3
 D NORM^%VVIDEO W !!!!,"Assurez-vous qu'il n'y a pas d'utilisateurs connectes sur la base "_QUI H 3
 W !,!,! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez vous l'elimination")_" ? ") Q:(Y1'=1)&(Y1'="OUI")
 D INTERNE
 Q
INTERNE 
 D MSG^%VZEATT($$^%QZCHW("Elimination en cours"))
 
 K ^[QUI]LK,^[QUI]QUERY1,^[QUI]QUERYV("%"),^[QUI]QUERY2("%"),^[QUI]QUERY3("%"),^[QUI]QUERY4("%")
 
 D ^%ANGARBA
 
 K ^[QUI]RQSDON("REMATDAT"),^[QUI]RQSDON("REMATSPE"),^[QUI]RQSDON("REMSIG"),^[QUI]RQSDON("REMPRVAL")
 D ZLIGT
 D SUPETTO
 Q
 
 
ZLIGT N I,%I
 S I="" F %I=0:0 S I=$O(^[QUI]ZLIGTRIE(I)) Q:I=""  I '($D(^[QUI]QUERY4("L0","^[QUI]ZLIGTRIE("""_I_""")"))) K ^[QUI]ZLIGTRIE(I)
 Q
 
 
SUPETTO 
 N I,%I,R
 S R=$$RI^TORQXIN
 S I="" F %I=0:1 S I=$$NXTRI^%QSTRUC8(R,I) Q:I=""  I '($D(^[QUI]TREEWORK(I))) D SX^%QSGESTK(R,I)
 S I="" F %I=0:0 S I=$O(^[QUI]CARATPC(I)) Q:I=""  I '($D(^[QUI]TREEWORK(I))) K ^[QUI]CARATPC(I)
 
 Q

