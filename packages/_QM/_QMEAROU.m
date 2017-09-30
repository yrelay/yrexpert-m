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

;%QMEAROU^INT^1^59547,73878^0
%QMEAROU ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AFFICH(LIBAT,BASE,IND) 
 N AT,ORD,REP
 S AT=$P(LIBAT,"^"),REP=$P(LIBAT,"^",2)
 S ORD=$P(AT,"(",2),ORD=$P(ORD,")"),AT=$P(AT,"(")
 I $E(AT)="%" Q $$^%QSCALVA(CXT("%","BASE"),CXT("%","OBJET"),AT)
 I $E(ORD)="%" S ORD=$$^%QSCALVA(CXT("%","BASE"),CXT("%","OBJET"),ORD)
 Q $$^%QSCALVU(REP,BASE,IND,AT,ORD)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AFFECT(BASE,IND,LIBAT,VAL,ORD) 
 Q:VAL=""
 N AT,LIEND,REP,OB
 S AT=$P(LIBAT,"^"),LIEND=$P(LIBAT,"^",2)
 I $E(ORD)="%" S ORD=$$^%QSCALVA(CXT("%","BASE"),CXT("%","OBJET"),ORD)
 S:ORD="" ORD=1
 I $E(AT)="%" S REP=CXT("%","BASE"),OB=CXT("%","OBJET") G MAJ
 Q:AT="NOM"
 S OB=$$OBPROX2^%QSCALVU(LIEND,BASE,IND,.REP)
 Q:(OB="")!(REP="")
 Q:$$TYPE^%QSGEST9(REP,AT)'=0
 I $$TYPE^%QSGESPE(AT_"/"_$$NOMLOG^%QSF(REP))="DATE" S VAL=$$INTF^%QMDAUC(REP,AT,VAL) I VAL="" S ECHEC=1 Q
 
 D:MODEX=2 STATT^%TLBAATT(REP,OB,AT,VAL,ORD,"AJOUT")
 D:MODEX'=1 PA^%QSGESTI(REP,OB,AT,VAL,ORD)
 Q
 
MAJ I (MODEX'=1)!((MODAF'=2)&(MODAF'=3)) D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),AT,VAL,ORD,"AJOUT") D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),AT,VAL,ORD)
 Q

