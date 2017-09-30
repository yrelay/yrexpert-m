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

;%TLOB13^INT^1^59547,74030^0
%TLOB13 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VALORL(IDEB,NBREG) 
 N L,POS,NOL,TEMP,GLR,GVAL,NAR,IVAL,VAL,TYP,INO,%I
 N PREF,SUF,BASE,REP,AT,ATTA,VARA,INDA,REPA
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLR=$$CONCAS^%QZCHAD(TEMP,"RESULTAT")
 S GVAL=$$CONCAS^%QZCHAD(TEMP,"VALEUR")
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Valorisation en cours"))
 S POS=1
 S L=V(IDEB+10)
 I L=$C(0) G VALO2
 G VALOS
VALO2 
 S L=$$^%QCAZG("LISTE")
VALOS S BASE=$$^%QSCALVA("L0",L,"OBJET")
 S REP=$$NOMINT^%QSF(BASE)
 S PREF=$$^%QSCALVA("L0",L,"ADRESSE")
 S AT=V(IDEB+5)
 
 S SUF=""
BOUCLE 
 S SUF=$O(@PREF@(SUF))
 I SUF="" G FVALO
 K @(GVAL)
 D MVG^%QSCALVA(REP,SUF,AT,GVAL,.TYP)
 I @GVAL=0 G BOUCLE
 S INO="" F %I=1:1 S INO=$O(@GVAL@(INO)) Q:INO=""  S VAL=@GVAL@(INO) S:'($D(@GLR@(VAL))) @GLR@(VAL)=""
 G BOUCLE
FVALO S ATTA=V(IDEB),INDA=V(IDEB+1),VARA=V(IDEB+3),REPA=$$NOMLOG^%QSF(V(IDEB+2))
 
 
 I MODEX'=1 S IVAL="" F %I=1:1 S IVAL=$O(@GLR@(IVAL)) Q:IVAL=""  D PA^%QSGESTI(REPA,VARA,ATTA,IVAL,IVAL)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Valorisation terminee"))
FIN1 K @(TEMP) Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
VALOR(IDEB,NBREG) 
 
 N TEMP,GLR,ATV,INDV,IVAL,VAL,TYP,%I,REP,AT,ATTA,VARA,INDA,REPA
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLR=$$CONCAS^%QZCHAD(TEMP,"RESULTAT")
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Valorisation en cours"))
 S AT=V(IDEB+5),REP=V(IDEB+7),INDV=V(IDEB+8)
 
 D MVG^%QSCALVA(REP,INDV,AT,GLR,.TYP)
 I @GLR=0 S ECHEC=1 G FIN2
 
 S ATTA=V(IDEB),INDA=V(IDEB+1),VARA=V(IDEB+3),REPA=$$NOMLOG^%QSF(V(IDEB+2))
 
 
 I MODEX'=1 S IVAL="" F %I=1:1 S IVAL=$O(@GLR@(IVAL)) Q:IVAL=""  S VAL=@GLR@(IVAL) D PA^%QSGESTI(REPA,VARA,ATTA,VAL,VAL)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Valorisation terminee"))
FIN2 K @(TEMP) Q 1
 
 
 
 
 
 
 
 
DIAL(IDEB,NBREG) 
 
 I (V(IDEB)="")!(V(IDEB)=$C(0)) D LISTE^%QSATTRI(V(IDEB+3),V(IDEB+2),1,4,79,17,V(IDEB+1)) Q 1
 I V(IDEB)="TOTEM" D DIAL^TORQSIDF(V(IDEB+2),V(IDEB+3)),CLEPAG^%VVIDEO Q 1
 D DIALOGUE^%QSATTRI(V(IDEB+3),V(IDEB+2),V(IDEB),V(IDEB+1)) Q 1
 Q 1
 
 
 
 
 
 
 
 
 
 
PREDICAT(IDEB,NBREG) 
 N RES,TYPAC,TRES
 S TYPAC=$S(V(IDEB+1)=$C(0):1,1:V(IDEB+1))
 I TYPAC Q $$EVAL^%PSPREV(V(IDEB),V(IDEB+2),V(IDEB+3))
 S TRES=$$TEMP^%SGUTIL
 S RES=$$EVAL2^%PSPREV(V(IDEB),V(IDEB+2),V(IDEB+3),TRES)
 S RES=@TRES K @(TRES)
 Q RES
 ;

