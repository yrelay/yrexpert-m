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

;%EDVDAT^INT^1^59547,73869^0
EDVDAT(LIEND,BA,OBJ,ATT,IND) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 G MESU
 N VAL,ATS,BAS
 S VAL=$$^%QSCALVU(LIEND,BA,OBJ,ATT,IND)
 Q:VAL="" ""
 I LIEND="" S BAS=BA G ATDAT
 I $E(LIEND)="%" S BAS=CXT(LIEND,"BASE") G ATDAT
 S BAS=$$^%QCAZG("^[QUI]RQSLIEN(BA,LIEND)")
 S BAS=$P(BAS,"^",2)
 Q:BAS="" VAL
ATDAT Q:BAS="%" VAL
 
 S ATS=ATT_"/"_$$NOMLOG^%QSF(BAS)
 I $$TYPE^%QSGESPE(ATS)="DATE" S VAL=$$AFFI^%QMDAUC(BAS,ATT,VAL)
 Q VAL
 
 
MESU 
 N VAL,ATS,BAS
 D DEB^%SGMESU("acces attributs dans GDX ")
 S VAL=$$^%QSCALVU(LIEND,BA,OBJ,ATT,IND)
 G:VAL="" MESUFIN
 I LIEND="" S BAS=BA G MATDAT
 I $E(LIEND)="%" S BAS=CXT(LIEND,"BASE") G MATDAT
 S BAS=$$^%QCAZG("^[QUI]RQSLIEN(BA,LIEND)")
 S BAS=$P(BAS,"^",2)
 G:BAS="" MESUFIN
MATDAT G:BAS="%" MESUFIN
 
 S ATS=ATT_"/"_$$NOMLOG^%QSF(BAS)
 I $$TYPE^%QSGESPE(ATS)="DATE" S VAL=$$AFFI^%QMDAUC(BAS,ATT,VAL)
MESUFIN 
 D FIN^%SGMESU("acces attributs dans GDX ")
 Q VAL
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VAL(BAS,OBJ,ATT,IND) 
 N VAL,ATS
 
 
 D DEB^%SGMESU("acces attributs dans GDX ")
 S VAL=$$^%QSCALIN(BAS,OBJ,ATT,IND)
 G:VAL="" MESUFIN
 G MATDAT
 
 
 S VAL=$$^%QSCALIN(BAS,OBJ,ATT,IND)
 Q:VAL="" ""
 G ATDAT
 ;
 ;

