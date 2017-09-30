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

;%SGCOSLE^INT^1^59547,73890^0
%SGCOSLE ;;02:29 PM  21 Sep 1993; 17 Feb 93 11:22 AM ; 21 Sep 93  2:29 PM
 
 
 
 
 
 
 
 
EXEC(TIMEXPI,TOUJOURS) 
 N LISTEPB,CARGEN,LPBCOUR,NPBPT
 N TRT,%T,T,A,%A,O,%O,IGEN,B,I,%I,LLI,NT,R,STATON
 N TYPCOUR,STBY,NATPB,SMETHG,%S,EXPIRE,TIMEX,NBPBT
 N TIMOK
 S STATON=0
 S EXPIRE=$S(TIMEXPI="":0,1:1)
 I EXPIRE S TIMEX=$TR(TIMEXPI,",",".")+0
 
 
 S LISTEPB="^[QUI]TEMPORAI(""LPB"")"
 S CARGEN="^[QUI]TEMPORAI(""CARGEN"")"
 
 S LISTATT="^[QUI]TEMPORAI(""ATT"")"
 
 S LISTRES="^[QUI]TEMPORAI(""RES"")"
 
 S TIMOK=$$^%SGCOSLD
 S NBPBT=0
 G:'(TIMOK) FIN
 
 S SOMMEIL=1,IPB="",OLDGEN="",STBY=0,SMETHG=0,NOMES=0
BOUCLE G:$$ISCTRLA^%SYSCLAV FIN I EXPIRE,$TR($H,",",".")>TIMEX G FIN
 I TIMOK=-1 S TIMOK=$$^%SGCOSLD G:'(TIMOK) FIN
 S LOOP=1
AGAIN G:$D(@LISTATT) PARGEN
 G:'(TOUJOURS) FIN
 I (LOOP#1000)=0 G:$$ISCTRLA^%SYSCLAV FIN
 I NOMES D CLEPAG^%VVIDEO,M^%SGCOSLV("en attente de probleme a traiter") S NOMES=0
 S LOOP=LOOP+1 I LOOP=10000 D UN^%SGCOSTA G BOUCLE
 G AGAIN
PARGEN 
 S IGEN="",OGEN=""
NXGEN S IGEN=$O(@LISTATT@(IGEN))
 I IGEN="" G BOUCLE
 S IPB=""
 
NXPB 
GETCOSL 
 S IPB=$O(@LISTATT@(IGEN,IPB)) I IPB="" D M^%SGCOSLV("fini ("_IGEN_")") G NXGEN
 S %R=$$DEBCRITB(IPB) G:'(%R) GETCOSL K:IPB'="" @LISTATT@(IGEN,IPB) D FINCRITB(IPB)
 S NATPB=@LISTEPB@(IPB,"TYPE")
 I OGEN'=IGEN D INITGEN S OGEN=IGEN
 S:NOMES NOMES=0
 D SOLVEPB
 G:$$ISCTRLA^%SYSCLAV FIN
 I EXPIRE,$TR($H,",",".")>TIMEX G FIN
 G NXPB
 
FIN 
 Q NBPBT
 
STBY I '(TOUJOURS) Q NBPBT
 I '(STATON) D UN^%SGCOSTA
 S STATON=$S(STATON=5:0,1:STATON+1)
 I '(STBY) D M^%SGCOSLV("en attente de probleme a traiter") S STATON=0
 S STBY=1
 G NXPB
 
 
INITGEN 
 I NATPB="TXP2RB" D INITTXP^%SGCOSLV
 I NATPB="SX" D INITSX^%SGCOSLV
 I NATPB="ATELIER" D INITATE^%SGCOSLV
 I NATPB="TRAITEMENT" D INITGTRT^%SGCOSLV
 Q
 
 
SOLVEPB 
 I NATPB="TST" D SOLVEPB^xslvt Q
 I NATPB="TXP2RB" D SOLVEPB^%TXPRSL1 ZZSYNC LISTRES D M^%SGCOSLV("") Q
 I NATPB="SX" D SOLVEPB^%QMEXSLV
 I NATPB="ATELIER" D SOLVEPB^%TXPACTI
 I NATPB="TRAITEMENT" D SOLVEPB^%TLIACPP
 Q
 
 
 
DEBCRITB(IPB) 
 L +^[QUI]SEMASOL("FILEATTB",IPB):0 Q $T Q
FINCRITB(IPB) 
 L -^[QUI]SEMASOL("FILEATTB",IPB)
 Q
 ;
 ;
 ;

