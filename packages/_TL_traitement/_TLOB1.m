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

;%TLOB1^INT^1^59547,74030^0
%TLOB1 ;;11:08 AM  25 Jun 1993; 25 Jun 93 11:05 AM ; 02 Nov 93  6:00 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERI(IDEB,NBREG) 
 N OORD,RES
 Q:$$INDREP^%TLOVER(V(IDEB+2),V(IDEB+1)) 0
 S OORD=$S(V(IDEB+3)=$C(0):"",1:V(IDEB+3))
 S RES=$$CREER^%QSGEIND(V(IDEB+1),V(IDEB+2),OORD,1,.MSG)
 S RES=$$AJCXT^%TLOPT(V(IDEB),V(IDEB+1),V(IDEB+2))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERL(IDEB,NBREG) 
 N NOM,RES,I,ADRESSE
 I NBREG=8,V(IDEB+7)'=$C(0) S NOM=V(IDEB+7) G CRL2
 S NOM=$$GEN^%QCAPOP(V(IDEB+5))
CRL2 S ADRESSE="^[QUI]ZLIGTRAI("_""""_NOM_""""_")"
 D CREERL^%QS0XG1(NOM,V(IDEB+6),ADRESSE,"TRAITEMENT",PARCO("TRT"))
 S RES=$$AFF^%TLOPT(V(IDEB+2),V(IDEB+3),V(IDEB),V(IDEB+1),NOM)
 
 Q 1
 
 
 
 
 
 
ELIML(IDEB,NBREG) 
 Q:'($$EX^%QSGEST7(V(IDEB))) 0
 D ELIML^%QS0XG1(V(IDEB))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DELIER(IDEB,NBREG) 
 D SUPS^%QSGES27(V(IDEB),V(IDEB+1),V(IDEB+2),V(IDEB+3),V(IDEB+4))
 Q 1
 
 
 
 
 
 
ELI(IDEB,NBREG) 
 D ^%QSUPSPE(V(IDEB),V(IDEB+1))
 D SX^%QSGESTK(V(IDEB),V(IDEB+1))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
INDI(IDEB,NBREG) 
 Q:'($$INDREP^%TLOVER(V(IDEB+6),V(IDEB+5))) 0
 S RES=$$AJCXT^%TLOPT(V(IDEB),V(IDEB+5),V(IDEB+6))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LIER(IDEB,NBREG) 
 N REPD
 S REPD=$P(^[QUI]RQSLIEN(V(IDEB),V(IDEB+2)),"^",2)
 Q:'($$IR^%QSGE5(V(IDEB),V(IDEB+1))) 0
 Q:'($$IR^%QSGE5(REPD,V(IDEB+3))) 0
 
 D ADDS^%QSGES26(V(IDEB),V(IDEB+1),V(IDEB+2),REPD,V(IDEB+3))
 Q 1
 ;

